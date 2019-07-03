/*
================================================================================

DEPRECATED:
    Use getUnitLoadout.

NAME:
    BRM_FMK_fnc_getGear

AUTHOR(s):
    bux578

DESCRIPTION:
    Returns an array containing all items of a given unit

PARAMETERS:
    0 - A player object. (OBJECT)

USAGE:
    [player] call BRM_FMK_fnc_getGear;

RETURNS:
    An array containing all inventory items. (ARRAY)

================================================================================
*/

params [["_unit", objNull, [objNull]]];

[
	headgear _unit,
	goggles _unit,
	uniform _unit,
		uniformItems _unit,
	vest _unit,
		vestItems _unit,
	backpack _unit,
		backpackItems _unit,
	primaryWeapon _unit,
		primaryWeaponItems _unit,
		primaryWeaponMagazine _unit,
	secondaryWeapon _unit,
		secondaryWeaponItems _unit,
		secondaryWeaponMagazine _unit,
	handgunWeapon _unit,
		handgunItems _unit,
		handgunMagazine _unit,
	assignedItems _unit,
	binocular _unit
]
