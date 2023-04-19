#include "script_component.hpp"
/*
================================================================================

NAME:
    BRM_FMK_fnc_addOptics

AUTHOR(s):
    Nife

DESCRIPTION:
    Add optics to a object.

PARAMETERS:
    0 - Object to add the optic to. (OBJECT)
    1 - Config name of the optic to add. (STRING)
    2 - (OPTIONAL) Amount to add. Defaults to 1. (NUMBER)

USAGE:
    [player, "Binocular"] call BRM_FMK_fnc_addOptics;
    [player, "Rangefinder"] call BRM_FMK_fnc_addOptics;
    [player, "Laserdesignator"] call BRM_FMK_fnc_addOptics;
    [crate, "Laserdesignator"] call BRM_FMK_fnc_addOptics;
    [crate, "Rangefinder", 5] call BRM_FMK_fnc_addOptics;
    [crate, "Binocular". 10] call BRM_FMK_fnc_addOptics;

RETURNS:
    Nothing

================================================================================
*/

params ["_unit", "_kind", ["_amount", 1]];

if (_kind == "") exitWith {};

if (_kind == "binoc") then { // Backward compatibility
	_kind = "Binocular";
};

if (_kind == "rangefinder" && mission_ACE3_enabled) then {
	_kind = "ACE_Vector";
};

private _battery = [_kind] call FUNCMAIN(getAmmoClass);

if (_unit isKindOf "Man") then {
	_unit addWeapon _kind;
	if (_battery != "") then {
		_unit addMagazine _battery;
	};
} else {
	_unit addWeaponCargoGlobal [_kind, 1];
	if (_battery != "") then {
		_unit addMagazineCargoGlobal [_battery, 1];
	};
};
