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

/*
Loads mission settings.
    This is where most of the editing work in the framework goes, including
    related plugin configuration.
*/
mission_settings = [] execVM "mission\settings\mission-settings.sqf";

// Initializes the mission tasks and other objective related functions.
mission_objectives = [] execVM "mission\objectives\tasks.sqf";

// Runs any scripts related to AI in the mission.
mission_init_enemies = [] execVM "mission\objectives\mission_AI.sqf";
