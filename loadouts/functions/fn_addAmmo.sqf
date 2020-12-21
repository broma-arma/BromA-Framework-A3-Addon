/*
================================================================================

NAME:
    BRM_FMK_fnc_addAmmo

AUTHOR(s):
    Nife

DESCRIPTION:
    Add magazines to an object. (Man: Vest > Backpack > Uniform)

PARAMETERS:
    0 - Object to add the item to. (OBJECT)
    1 - Config name of the item to add. (STRING)
    2 - (OPTIONAL) Amount to add, default 1. (NUMBER)

USAGE:
    [player, "100Rnd_65x39_caseless_mag"] call BRM_FMK_fnc_addItem;
    [player, "100Rnd_65x39_caseless_mag", 2] call BRM_FMK_fnc_addItem;
    [crate, "100Rnd_65x39_caseless_mag", 20] call BRM_FMK_fnc_addItem;

RETURNS:
    The amount that was added. (NUMBER)

================================================================================
*/

params ["_object", "_kind", ["_amount", 1]];

[_object, _kind, _amount, "vbu"] call BRM_FMK_fnc_addItem
