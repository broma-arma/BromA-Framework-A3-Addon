/*
================================================================================

NAME:
    BRM_FMK_fnc_addAmmoAuto

AUTHOR(s):
    Nife

DESCRIPTION:
    Dynamically chooses a magazine to add to an object, based on compatible magazine config names.

PARAMETERS:
    0 - Object to add the item to. (OBJECT)
    1 - Config name of the weapon. (STRING)
    2 - Amount to add. (NUMBER)
    3 - Array of search terms. (ARRAY of STRING)
    4 - (OPTIONAL) Muzzle, default 0. (NUMBER)

USAGE:
    [player, "arifle_MX_SW_F", 3, ["CASELESS"]] call BRM_FMK_fnc_addAmmoAuto;
    [player, "arifle_MX_SW_F", 2, ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
    [player, "hgun_PDW2000_F", 1, ["TRACER"]] call BRM_FMK_fnc_addAmmoAuto;
    [crate, "hgun_PDW2000_F", 10, ["GREEN"]] call BRM_FMK_fnc_addAmmoAuto;
    [crate, "arifle_MX_SW_F", 20, ["RED"]] call BRM_FMK_fnc_addAmmoAuto;

RETURNS:
    The amount that was added. -1: no magazines found for specified search. (NUMBER)

================================================================================
*/

params ["_object", "_weapon", "_amount", "_type", ["_muzzle", 0]];

private _magazine = [_weapon, _type, _muzzle] call BRM_FMK_fnc_getAmmoClass;

if (_magazine == "") exitWith { -1 };

[_object, _magazine, _amount, "vbu"] call BRM_FMK_fnc_addItem
