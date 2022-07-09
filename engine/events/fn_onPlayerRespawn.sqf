/*
================================================================================

NAME:
    BRM_FMK_fnc_onPlayerRespawn

AUTHOR(s):
    Nife

DESCRIPTION:
    Handles player respawn events.

PARAMETERS:
    0 - Unit killed. (OBJECT)
    1 - Killer of said unit. (OBJECT)

USAGE:
    Internal

RETURNS:
    Nothing.

================================================================================
*/

params ["_unit", "_corpse"];

[_unit, _corpse] call BRM_fnc_onPlayerRespawn; // TODO Use CBA events for this?
