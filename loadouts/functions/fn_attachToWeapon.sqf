#include "script_component.hpp"
/*
================================================================================

NAME:
    BRM_FMK_fnc_attachToWeapon

AUTHOR(s):
    Nife

DESCRIPTION:
    Add an item, weapon, magazine or backpack to an object.

PARAMETERS:
    0 - Object to add the item to. (OBJECT)
    1 - Weapon type: "primary", "secondary", or "handgun" (STRING)
    2 - Attachment config name. (String)

USAGE:
    [player, "primary", "optic_aco"] call BRM_FMK_fnc_attachToWeapon;
    [player, "secondary", "acc_pointer_ir"] call BRM_FMK_fnc_attachToWeapon;
    [player, "handgun", "muzzle_snds_acp"] call BRM_FMK_fnc_attachToWeapon;

RETURNS:
    Nothing

================================================================================
*/

params ["_unit", "_type", "_kind"];

if (_kind isEqualTo "") exitWith {};

switch (_type) do {
	case "primary": { _unit addPrimaryWeaponItem _kind };
	case "secondary": { _unit addSecondaryWeaponItem _kind };
	case "handgun": { _unit addHandgunItem _kind };
};
