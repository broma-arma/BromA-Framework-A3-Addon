/*
================================================================================

NAME:
    BRM_FMK_fnc_halo

AUTHOR(s):
    Coryf88

DESCRIPTION:
    HALO drop a unit.

PARAMETERS:
    0 - Unit. (OBJECT)
    1 - (OPTIONAL) Altitude, minimum of 500. -1 to not change unit altitude. Default 2000 (NUMBER)
    2 - (OPTIONAL) Parachute backpack classname. Default "B_Parachute" (STRING)
    3 - (OPTIONAL) Altitude to automatically deploy parachute. -1 to not auto-deploy. -2 to auto-deploy immediately. Default -1 (NUMBER)

USAGE:
    player call BRM_FMK_fnc_halo;
    [player, 5000] call BRM_FMK_fnc_halo;

RETURNS:
    Nothing.

================================================================================
*/

params [
	["_unit", objNull, [objNull]],
	["_altitude", 2000, [0]],
	["_backpack", "B_Parachute", [""]],
	["_autoAltitude", -1, [0]]
];

if (isNull _unit) exitWith {};
if (!local _unit) exitWith { _this remoteExec ["BRM_FMK_fnc_halo", _unit]; };

if !(_unit getVariable ["unit_initialized", false]) exitWith {
	_unit spawn {
		waitUntil { sleep 0.01; _this getVariable ["unit_initialized", false] };
		_this call BRM_FMK_fnc_halo;
	};
};

if (_altitude > 0) then {
	_unit setPosATL ((getPosATL _unit select [0, 2]) + [_altitude max 500]);
};

private _backpackLoadout = getUnitLoadout _unit select 5;
removeBackpack _unit;
if !(901 in getArray (configfile >> "CfgVehicles" >> _backpack >> "allowedSlots") && getText (configfile >> "CfgVehicles" >> _backpack >> "backpackSimulation") == "ParachuteSteerable") then {
	_backpack = "B_Parachute";
};
_unit addBackpack _backpack;

if (_autoAltitude > 0) then {
	[_unit, _autoAltitude] spawn {
		params ["_unit", "_autoAltitude"];

		waitUntil { sleep 0.1; getPosATL _unit select 2 <= _autoAltitude || !(getUnitFreefallInfo _unit select 0) };

		if (isNull objectParent _unit && getUnitFreefallInfo _unit select 0) then {
			_unit action ["OpenParachute", _unit];
		};
	};
};
if (_autoAltitude == -2) then {
	_unit action ["OpenParachute", _unit];
};

_unit setVariable ["BRM_FMK_fnc_halo_backpackLoadout", _backpackLoadout];
_unit setVariable ["BRM_FMK_fnc_halo_GetOutEH", _unit addEventHandler ["GetOutMan", {
	params ["_unit", "_role", "_vehicle", "_turret", "_isEject"];

	if (_vehicle isKindOf "ParachuteBase") then {
		deleteVehicle _vehicle;
	};
}]];

_unit addEventHandler ["AnimChanged", {
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
