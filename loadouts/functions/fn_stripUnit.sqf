/*
================================================================================

NAME:
    BRM_FMK_fnc_stripUnit

AUTHOR(s):
    Nife

DESCRIPTION:
    Removes a Man object's uniform, vest, backpack, headgear, and goggles.

PARAMETERS:
    0 - Man object. (OBJECT)

USAGE:
    [player] call BRM_FMK_fnc_stripUnit

RETURNS:
    Nothing

================================================================================
*/

params ["_unit"];

removeVest _unit;
removeHeadgear _unit;
removeBackpack _unit;
removeGoggles _unit;
removeUniform _unit;
