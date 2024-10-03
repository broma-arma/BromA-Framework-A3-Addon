/*
================================================================================

DEPRECATED:
    Remove usage.

NAME:
    BRM_FMK_fnc_initAI

AUTHOR(s):
    Nife

DESCRIPTION:
    Initializes an AI unit with their loadout and environment variables.

PARAMETERS:
    0 - Target unit. (OBJECT)
    1 - Faction the unit belongs to. (STRING)

USAGE:
    [aiUnit, "SLA"] call BRM_FMK_fnc_initAI;
    [this, "RACS"] call BRM_FMK_fnc_initAI;

RETURNS:
    Nothing.

================================================================================
*/

_this call BRM_FMK_Engine_fnc_initAI;
