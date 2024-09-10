/*
================================================================================

DEPRECATED:
    Replace usage with: [_cargo, [_side, _kind] call BRM_FMK_fnc_getRadio, _amount] call BRM_FMK_fnc_addItem;

NAME:
    BRM_FMK_fnc_addRadioToCargo

AUTHOR(s):
    Nife

DESCRIPTION:
    Add a radio to a cargo object.

PARAMETERS:
    0 - Cargo object to add the radio to. (OBJECT)
    1 - "SR", "LR", or "BP". (STRING)
    2 - WEST, EAST, or RESISTANCE. (SIDE)
    2 - (OPTIONAL) Amount to add. Defaults to 1. (NUMBER)

USAGE:
    [crate, "SR", WEST, 20] call BRM_FMK_fnc_addRadioToCargo;
    [crate, "LR", WEST, 10] call BRM_FMK_fnc_addRadioToCargo;
    [crate, "BP", WEST, 5] call BRM_FMK_fnc_addRadioToCargo;

RETURNS:
    Nothing

================================================================================
*/

params ["_cargo", "_kind", "_side", ["_amount", 1]];

[_cargo, [_side, _kind] call BRM_FMK_fnc_getRadio, _amount] call BRM_FMK_fnc_addItem;
