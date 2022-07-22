/*
================================================================================

NAME:
    BRM_FMK_fnc_onPlayerKilled

AUTHOR(s):
    Nife

DESCRIPTION:
    Handles player killed events.

PARAMETERS:
    0 - Unit killed. (OBJECT)
    1 - Killer of the unit. (OBJECT)
    2 - Unit that pulled the trigger. (OBJECT)
    3 - Use destruction effects. (BOOL)

USAGE:
    Internal

RETURNS:
    Nothing.

================================================================================
*/

params ["_unit", "_killer", "_instigator", "_useEffects"];

["BRM_FMK_playerKilled", _this] call CBA_fnc_localEvent;
_this call BRM_FMK_fnc_handleScore;
_this call BRM_fnc_onPlayerKilled;
