/*
================================================================================

NAME:
    BRM_FMK_fnc_halo

AUTHOR(s):
    Coryf88

DESCRIPTION:
    HALO drop a player.

PARAMETERS:
    0 - Player. (OBJECT)
    1 - (OPTIONAL) Altitude, minimum of 500. -1 to not change player altitude. Default 2000 (NUMBER)
    2 - (OPTIONAL) Parachute backpack classname. Default "B_Parachute" (STRING)
    2 - (OPTIONAL) Altitude to automatically deploy parachute. -1 to not auto-deploy. -2 to auto-deploy immediately. Default -1 (NUMBER)

USAGE:
    player call BRM_FMK_fnc_halo;
    [player, 5000] call BRM_FMK_fnc_halo;

RETURNS:
    Nothing.

================================================================================
*/

params [
	["_player", objNull, [objNull]],
	["_altitude", 2000, [0]],
	["_backpack", "B_Parachute", [""]],
	["_autoAltitude", -1, [0]]
];

if (isNull _player) exitWith {};
if (!local _player) exitWith { _this remoteExec ["BRM_FMK_fnc_halo", _player]; };

if !(_player getVariable ["unit_initialized", false]) exitWith {
	_player spawn {
		waitUntil { sleep 0.01; _this getVariable ["unit_initialized", false] };
		_this call BRM_FMK_fnc_halo;
	};
};

private _posATL = getPosATL _player;
if (_altitude > 0) then {
	_player setPosATL ((getPosATL _player select [0, 2]) + [_altitude max 500]);
};

private _backpackLoadout = getUnitLoadout _player select 5;
removeBackpack _player;
if !(901 in getArray (configfile >> "CfgVehicles" >> _backpack >> "allowedSlots") && getText (configfile >> "CfgVehicles" >> _backpack >> "backpackSimulation") == "ParachuteSteerable") then {
	_backpack = "B_Parachute";
};
_player addBackpack _backpack;

if (_autoAltitude > 0) then {
	[_player, _autoAltitude] spawn {
		params ["_player", "_autoAltitude"];

		waitUntil { sleep 0.1; getPosATL _player select 2 <= _autoAltitude || !(getUnitFreefallInfo _player select 0) };

		if (getUnitFreefallInfo _player select 0) then {
			_player action ["OpenParachute", _player];
		};
	};
};
if (_autoAltitude == -2) then {
	_player action ["OpenParachute", _player];
};

_player setVariable ["BRM_FMK_fnc_halo_backpackLoadout", _backpackLoadout];
_player setVariable ["BRM_FMK_fnc_halo_GetOutEH", _player addEventHandler ["GetOutMan", {
	params ["_unit", "_role", "_vehicle", "_turret", "_isEject"];

	if (_vehicle isKindOf "ParachuteBase") then {
		deleteVehicle _vehicle;
	};
}]];

_player addEventHandler ["AnimChanged", {
	params ["_unit", "_anim"];

	if !(getUnitFreefallInfo _unit select 0) then {
		private _loadout = getUnitLoadout _unit;
		_loadout set [5, _unit getVariable ["BRM_FMK_fnc_halo_backpackLoadout", []]];
		_unit setVariable ["BRM_FMK_fnc_halo_backpackLoadout", nil];
		_unit setUnitLoadout _loadout;
		_unit removeEventHandler ["AnimChanged", _thisEventHandler];
		_unit removeEventHandler ["GetOutMan", _unit getVariable "BRM_FMK_fnc_halo_GetOutEH"];
		_unit setVariable ["BRM_FMK_fnc_halo_GetOutEH", nil];
	};
}];
