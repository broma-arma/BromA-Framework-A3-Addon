/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_loadSettings

AUTHOR(s):
    Nife

DESCRIPTION:
    Loads mission settings.

PARAMETERS:
    None.

USAGE:
    [] call BRM_FMK_Engine_fnc_loadSettings;

RETURNS:
    Nothing.

================================================================================
*/

[] call compile preprocessFileLineNumbers "mission\settings\mission-settings.sqf";
