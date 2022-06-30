/*
================================================================================

NAME:
    BRM_fnc_engine_pre

AUTHOR(s):
    Nife

DESCRIPTION:
    Starts loading the framework.

PARAMETERS:
    None.

USAGE:
    PreInit

RETURNS:
    Nothing.

================================================================================
*/

private _cfgMissionVersion = missionConfigFile >> "BRM_Framework" >> "mission_version";
if (isArray _cfgMissionVersion) then {
	BRM_version = getArray _cfgMissionVersion;
} else {
	// Backwards compatibility
	private _localVersion = call compile preprocessFile "framework\local_version.txt" splitString "" apply { parseNumber _x };
	for "_i" from count _localVersion to 3 do {
		_localVersion pushBack 0;
	};
	BRM_version = _localVersion;
};

if ([BRM_version, [0, 7, 5]] call BRM_FMK_fnc_versionCompare > 0) then { // > v0.7.5
	[] call BRM_FMK_fnc_initVariables;

	// TODO Remove execVM usage
	mission_settings = [] execVM "mission\settings\mission-settings.sqf";
	mission_objectives = [] execVM "mission\objectives\tasks.sqf"; // Needs to be done after mission-settings.sqf and BRM_FMK_fnc_createPlayerVehicles (PostInit)
	mission_init_enemies = [] execVM "mission\objectives\mission_AI.sqf"; // mission_AI_controller (headless_client plugin PostInit) and BRM_fnc_logPlugins (PostInit)
};

["LOCAL", "F_LOG", ""] call BRM_FMK_fnc_doLog;
["LOCAL", "F_LOG", format ["STARTING MISSION '%1'", briefingName]] call BRM_FMK_fnc_doLog;
["LOCAL", "F_LOG", ""] call BRM_FMK_fnc_doLog;

startTime = diag_tickTime;
pluginsLoaded = false;
