/*
================================================================================

NAME:
    BRM_FMK_fnc_endMission

AUTHOR(s):
    Coryf88

DESCRIPTION:
    End the mission.

PARAMETERS:
    0 - End classname, defined in BRM_FMK >> Endings in mission or addon config (STRING)

USAGE:
    ["victory"] call BRM_FMK_fnc_endMission

RETURNS:
    Nothing.

================================================================================
*/

_this call BRM_FMK_Engine_fnc_endMission;
