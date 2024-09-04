/*
================================================================================

NAME:
    BRM_FMK_fnc_engine_pre

AUTHOR(s):
    Nife

DESCRIPTION:
    Starts loading the framework.

PARAMETERS:
    None.

USAGE:
    [] call BRM_FMK_fnc_engine_pre

RETURNS:
    Nothing.

================================================================================
*/

["LOCAL", "F_LOG", ""] call BRM_FMK_fnc_doLog;
["LOCAL", "F_LOG", format ["STARTING MISSION '%1'", briefingName]] call BRM_FMK_fnc_doLog;
["LOCAL", "F_LOG", ""] call BRM_FMK_fnc_doLog;

startTime = diag_tickTime;
pluginsLoaded = false;

call BRM_FMK_fnc_loadContentCargo;
