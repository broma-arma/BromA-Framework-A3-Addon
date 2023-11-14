/*
================================================================================

NAME:
    BRM_FMK_fnc_artillery

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Create a falling CfgAmmo.

PARAMETERS:
    0 - Target. If an array, will randomly select one for each shot. (OBJECT / MARKER / POSITION2D / POSITION3D / ARRAY)
    1 - CfgAmmo classname. If an array, will randomly select one for each shot. (STRING / ARRAY)
    2 - (OPTIONAL) Radius around target to target. Array format is [minRadius, maxRadius]. Default 0 (NUMBER / ARRAY)
    3 - (OPTIONAL) Delay, in seconds, between shots. Array format is [minSeconds, randomSeconds] or [minSeconds, midSeconds, maxSeconds]. Default 1 (NUMBER)
    4 - (OPTIONAL) Number of shots. Default 1 (NUMBER)
    5 - (OPTIONAL) CfgSounds classname to play for each shot. Empty string ("") for no sound (STRING / ARRAY / CODE)
        CODE - params ["_ammo", "_cfgAmmo", "_ammoSimulation"]; // Ammo classname, ammo config, and ammo simulation.

USAGE:
    [player, "F_20mm_white"] call BRM_FMK_fnc_artillery;
    [allPlayers, ["F_20mm_white", "F_20mm_Red", "F_20mm_yellow", "F_20mm_green"], 50] call BRM_FMK_fnc_artillery;

RETURNS:
    Nothing.

================================================================================
*/

if (!canSuspend) exitWith { _this spawn BRM_FMK_fnc_artillery };

params [
	["_targets", objNull, [objNull, "", []]],
	["_ammos", "Sh_82mm_AMOS", ["", []]],
	["_radius", 0, [0, []]],
	["_delay", 1, [0, []]],
	["_count", 1, [0]],
	["_sounds", {
		params ["_ammo", "_cfgAmmo", "_ammoSimulation"];
		if (_ammoSimulation in ["shotIlluminating", "shotNVGMarker", "shotSmoke", "shotSmokeX"]) exitWith { "" };
		[format ["shell%1", floor random 4 + 1], format ["mortar%1", floor random 2 + 1]] select (getNumber (_cfgAmmo >> "hit") < 200)
		//shell1 0.160, shell2 0.640, shell3 0.440, shell4 0.930, mortar1 0.110, mortar2 0.000
	}, [{}, [], ""]]
];

private _G = 9.8066;
private _G2 = sqrt _G;

for "_i" from 1 to _count do {
	if (_i > 1) then {
		private _d = _delay;
		if (_d isEqualType []) then {
			_d = if (count _d == 2) then { (_d select 0) + random (_d select 1) } else { random _d };
		};
		sleep _d;
	};

	private _pos = _targets;
	if !(_pos isEqualType [] && { _pos select 0 isEqualType 0 }) then {
		if (_pos isEqualType []) then { _pos = selectRandom _pos; };
		_pos = if (_pos isEqualType "") then { getMarkerPos _pos } else { getPos _pos };
	};
	if (_radius isEqualType []) then {
		_radius = (_radius select 0) + random (_radius select 1);
	};
	if (_radius > 0) then {
		_pos = _pos getPos [random _radius, random 360];
	};
	_pos set [2, 0];

	private _ammo = _ammos;
	if (_ammo isEqualType []) then { _ammo = selectRandom _ammo; };

	private _velocity = [0, 0, -100];

	private _cfgAmmo = configFile >> "CfgAmmo" >> _ammo;
	if (getText (_cfgAmmo >> "simulation") == "shotSubmunitions") then {
		// "Sub_F_Signal_Green"
		_cfgAmmo = configFile >> "CfgAmmo" >> getText (_cfgAmmo >> "submunitionAmmo");
	};

	private _ammoSimulation = getText (_cfgAmmo >> "simulation");

	private _sound = _sounds;
	private _dirAndUp = [[0, 0, -1], [0, 1, 0]];

	switch (_ammoSimulation) do {
		case "shotIlluminating": {
			_velocity = [0, 0, -0.01]; // Velocity cannot be 0, otherwise flare won't fall.
			_sound = "";

			private _timeToLive = getNumber (_cfgAmmo >> "timeToLive");
			private _triggerTime = getNumber (_cfgAmmo >> "triggerTime");
			private _airFriction = getNumber (_cfgAmmo >> "airFriction");
			if (_airFriction <= 0) then {
				_airFriction = abs _airFriction;
				_airFriction = if (_airFriction == 0) then { _G * _triggerTime ^ 2 / 2 } else { (_G2 * _airFriction ^ -0.5) * _triggerTime };
				private _flareAirFriction = abs getNumber (_cfgAmmo >> "flareAirFriction");
				_flareAirFriction = if (_flareAirFriction == 0) then { _G * (_timeToLive - _triggerTime) ^ 2 / 2 } else { (_G2 * _flareAirFriction ^ -0.5) * (_timeToLive - _triggerTime) };
				_pos set [2, _airFriction + _flareAirFriction];
			} else {
				_pos set [2, _timeToLive * 5 min 1000];
			};
		};
		case "shotNVGMarker";
		case "shotSmoke";
		case "shotSmokeX": {
			_velocity = [0, 0, 0];
			_sound = "";
		};
		case "shotMissile": {
			if ((getArray (_cfgAmmo >> "soundFly") select 0) isNotEqualTo "") then {
				_sound = "";
			};
			private _height = (getNumber (_cfgAmmo >> "timeToLive") * 75) max (getNumber (_cfgAmmo >> "fuseDistance") + 1) min 1000;
			_pos set [2, _height];
		};
		case "shotBullet": {
			_sound = "";
			_pos set [2, 50];
		};
		case "shotShell";
		case "shotGrenade";
		case "shotSubmunitions";
		case "shotDeploy";
		case "shotRocket": {
			private _height = (getNumber (_cfgAmmo >> "timeToLive") * 75) max (getNumber (_cfgAmmo >> "fuseDistance") + 1) min 1000;
			_pos set [2, _height];
		};
		case "shotDirectionalBomb";
		case "shotMine";
		case "shotSpread";
		case "laserDesignate";
		case "shotBoundingMine";
		case "shotLaser";
		case "shotTimeBomb";
		case "shotCM";
		default {
			["Ammo simulation '%1' is not supported", _ammoSimulation] call BIS_fnc_error;
			_ammoSimulation = "";
		};
	};

	if (_ammoSimulation isEqualTo "") exitWith {};

	if (_sound isEqualType {}) then {
		_sound = [_ammo, _cfgAmmo, _ammoSimulation] call _sound;
	};
	if (_sound isEqualType []) then {
		_sound = selectRandom _sound;
	};
	if (_sound isNotEqualTo "") then {
		[_sound, ATLToASL _pos] call BRM_FMK_fnc_playCfgSound;
	};

	private _projectile = createVehicle [if (_ammo isEqualType []) then { selectRandom _ammo } else { _ammo }, _pos];
	_projectile setPos _pos;
	if (!isNil "_dirAndUp") then {
		_projectile setVectorDirAndUp _dirAndUp;
	};
	_projectile setVelocity _velocity;
};
