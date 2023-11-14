/*
================================================================================

NAME:
    BRM_FMK_fnc_cas

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Create a plane that does a CAS run on a specified position.

PARAMETERS:
    0 - Target. (POSITIONATL / OBJECT)
    1 - Plane classname. (STRING)
    2 - (OPTIONAL) Weapon type bitflags. 1: Gun, 2: Missile, 4: Bomb, 8: Rocket, 16: Cannon. Default 1 (NUMBER)
    3 - (OPTIONAL) Direction, degrees, of the CAS run. -1 for random direction. Default -1 (NUMBER)

USAGE:
    [[1800, 1400, 0], "B_Plane_CAS_01_F", 1] call BRM_FMK_fnc_cas; // Gun run from a random direction
    [[1800, 1400, 0], "B_Plane_CAS_01_F", 31, 0] call BRM_FMK_fnc_cas; // Gun, Missile, Bomb, Rocket, and/or Cannon run from the South.

RETURNS:
    Nothing.

================================================================================
*/
// Based on BIS_fnc_moduleCAS

if (!canSuspend) exitWith { _this spawn BRM_FMK_fnc_cas };

params [
	["_posATL", objNull, [[], objNull], [3]],
	["_planeClass", "B_Plane_CAS_01_F", [""]],
	["_weaponFlags", 1, [0]], // Bits - 1: Gun, 2: Missile, 4: Bomb, 8: Rocket, 16: Cannon
	["_direction", -1, [0]]
];

if !(_planeClass isKindOf "Plane") exitWith { ["Vehicle class '%1' is not of type 'Plane'", _planeClass] call BIS_fnc_error; };

private _cfgPlane = configFile >> "CfgVehicles" >> _planeClass;
if !(isClass _cfgPlane) exitWith { ["Vehicle class '%1' not found", _planeClass] call BIS_fnc_error; };

private _weaponTypes = [];
{
	if ([_weaponFlags, 2 ^ _forEachIndex] call BIS_fnc_bitwiseAND != 0) then {
		_weaponTypes pushBack _x;
	};
} forEach ["machinegun", "missilelauncher", "bomblauncher", "rocketlauncher", "cannon"];

if (count _weaponTypes == 0) exitwith { ["No valid weapon types specified '%1'", _weaponFlags] call BIS_fnc_error; };

private _weapons = _planeClass call BIS_fnc_weaponsEntityType apply {
	[_x, toLower ((_x call BIS_fnc_itemType) select 1)]
} select {
	_x select 1 in _weaponTypes && { getArray (configFile >> "CfgWeapons" >> (_x select 0) >> "modes") isNotEqualTo [] }
};

if (count _weapons == 0) exitwith { ["No weapon of types %2 found on '%1'", _planeClass, _weaponTypes] call BIS_fnc_error; };

if (!(_posATL isEqualType []) && { isNull _posATL }) exitWith {};

private _targetPos = if (_posATL isEqualType []) then { +_posATL } else { getPosATL _posATL };
_targetPos set [2, (_targetPos select 2) + getTerrainHeightASL _targetPos];
private _dir = if (_direction < 0) then { random 360 } else { _direction };

private _distance = 3000;
private _altitude = 1000;
private _speed = 400 / 3.6; // 400 km/h
private _duration = ([0, 0] distance [_distance, _altitude]) / _speed;

// Create plane
private _planePos = _targetPos getPos [_distance, _dir + 180];
_planePos set [2, (_targetPos select 2) + _altitude];
private _planeSide = getNumber (_cfgPlane >> "side") call BIS_fnc_sideType;

[_planePos, _dir, _planeClass, _planeSide] call BIS_fnc_spawnVehicle params ["_vehicle", "_crew", "_group"];
_vehicle setPosASL _planePos;
_vehicle flyInHeight _altitude;
_vehicle move (_targetPos getPos [_distance, _dir]);
_vehicle disableAI "MOVE";
_vehicle disableAI "TARGET";
_vehicle disableAI "AUTOTARGET";
_vehicle disableAI "RADIOPROTOCOL";
_vehicle setCombatMode "BLUE";
_vehicle setVariable ["bis_aiEjected", true]; // Prevent ejecting. (See BIS_fnc_planeAiEject)

_vehicle addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

	if (_weapon call BIS_fnc_itemType select 1 == "missilelauncher") then {
		private _forward = getPosASL _projectile vectorFromTo (getPosASL (_unit getVariable "target") vectorAdd [0, 0, 20]);
		_projectile setVectorDirAndUp [_forward, _forward vectorCrossProduct (_forward vectorCrossProduct [0, 0, 1]) vectorMultiply -1];
	};
}];

private _vectorDir = _planePos vectorFromTo _targetPos;
private _velocity = _vectorDir vectorMultiply _speed;
_vehicle setVectorDir _vectorDir;
[_vehicle, -90 + atan (_distance / _altitude), 0] call BIS_fnc_setPitchBank;
private _vectorUp = vectorUp _vehicle;

// Remove all other weapons
private _currentWeapons = weapons _vehicle;
{
	if !(toLower (_x call BIS_fnc_itemType select 1) in (_weaponTypes + ["countermeasureslauncher"])) then {
		_vehicle removeWeapon _x;
	};
} foreach _currentWeapons;

private _fire = scriptNull;
private _fired = false;
private _time = time;
while { alive _vehicle && !(isNull _vehicle || (_fired && scriptDone _fire)) } do {
	_vehicle setVelocityTransformation [
		_planePos, _targetPos,
		_velocity, _velocity, _vectorDir, _vectorDir, _vectorUp, _vectorUp,
		(time - _time) / _duration
	];

	if (!_fired && { getPosASL _vehicle distanceSqr _targetPos < 1000000 }) then { // 1000
		_fired = true;

		private _target = createVehicle [["LaserTargetE", "LaserTargetW"] select (_planeSide getFriend WEST >= 0.6), _targetPos select [0, 2], [], 0, "CAN_COLLIDE"];
		_vehicle setVariable ["target", _target];
		_target spawn {
			// Prevent LaserTarget from being deleted by Engine
			while { !isNull _this } do {
				_this setPosASL getPosASL _this;
				sleep 5;
			};
		};
		_vehicle reveal _target;
		_vehicle doWatch _target;
		_vehicle doTarget _target;

		_fire = [_vehicle, _weapons, _target] spawn {
			params ["_vehicle", "_weapons", "_target"];

			private _duration = 3;
			private _time = time + _duration;
			private _bombed = false;
			waitUntil {
				{
					if (_x select 1 == "bomblauncher") then {
						if (!_bombed) then {
							_vehicle fireAtTarget [_target, _x select 0];
						};
						_bombed = true;
					} else {
						_vehicle fireAtTarget [_target, _x select 0];
					};
				} forEach _weapons;
				sleep 0.1;
				time > _time || isNull _vehicle
			};
			_target spawn {
				sleep 30;
				deleteVehicle _this;
			};
		};
	};

	sleep 0.01;
};
_vehicle enableAI "MOVE";

// Countermeasures
for "_i" from 0 to 1 + floor random 3 do {
	driver _vehicle forceWeaponFire ["CMFlareLauncher", "Burst"];
	_time = time + random [0.5, 1, 2];
	waitUntil { !alive _vehicle || isNull _vehicle || time >= _time };
	if (!alive _vehicle || isNull _vehicle) exitWith {};
};

// Cleanup
_time = time + 300;
waitUntil { _vehicle distanceSqr _targetPos >= _distance ^ 2 || time >= _time };

{ deleteVehicle _x; } foreach _crew;
deleteGroup _group;
deleteVehicle _vehicle;
