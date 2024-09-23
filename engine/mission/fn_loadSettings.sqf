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

mission_game_mode = toLower mission_game_mode;
side_a_faction = toUpper side_a_faction;
side_b_faction = toUpper side_b_faction;
side_c_faction = toUpper side_c_faction;
