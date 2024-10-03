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

if (BRM_FMK_Engine_compatVersion == 0) then {
	[] call compile preprocessFileLineNumbers "mission\settings\mission-settings.sqf";
} else {
	mission_settings_loaded = false;

	[] call compile preprocessFileLineNumbers "mission\settings\mission.sqf";

	endings_victory = "victory";
	endings_defeat = "defeat";
	endings_civilians_killed = "defeat";
	endings_time_over = "defeat";
	endings_tvt_auto = "tvt_end";
	{
		missionNamespace setVariable [format ["endings_tvt_side_%1_victory", _x], format ["side_%1_victory", _x]];
		missionNamespace setVariable [format ["endings_tvt_side_%1_defeat", _x], format ["side_%1_defeat", _x]];
	} forEach ["a", "b", "c"];

	mission_enable_side_c = side_c_faction != "";

	// Backward compatibility
	units_player_useVanillaGear = mission_vanilla_player_loadouts;
	units_AI_useVanillaGear = mission_vanilla_ai_loadouts;
	read_local_cargo = false;
	mission_author_name = [getMissionConfigValue ["Author", "Unknown"]];
	mission_version = missionName splitString "_" param [3, "v0"];

	call compile preprocessFileLineNumbers "mission\settings\plugin.sqf";

	mission_settings_loaded = true;
};

mission_game_mode = toLower mission_game_mode;
side_a_faction = toUpper side_a_faction;
side_b_faction = toUpper side_b_faction;
side_c_faction = toUpper side_c_faction;
