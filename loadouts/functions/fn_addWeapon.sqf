#include "script_component.hpp"
/*
================================================================================

NAME:
    BRM_FMK_fnc_addWeapon

AUTHOR(s):
    Nife

DESCRIPTION:
    Add weapons to an object.

PARAMETERS:
    0 - Object to add the item to. (OBJECT)
    1 - Config name of the item to add. (STRING)
    2 - (OPTIONAL) Cargo object only: Amount to add, default 1. (NUMBER)

USAGE:
    [player, "arifle_MX_F"] call BRM_FMK_fnc_addWeapon;
    [crate, "arifle_MX_F", 2] call BRM_FMK_fnc_addWeapon;
    [crate, "arifle_MX_SW_F", 5] call BRM_FMK_fnc_addWeapon;

RETURNS:
    Nothing

================================================================================
*/

params ["_unit", "_kind", ["_amount", 1]];

if (_kind isEqualType []) then {
	_kind = _kind select 0;
};

if (_kind isEqualTo "") exitWith {};

if (_unit isKindOf "Man") then {
	_unit addWeapon _kind;
} else {
	_unit addWeaponCargoGlobal [_kind, _amount];
};
