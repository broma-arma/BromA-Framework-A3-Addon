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

if (!isNil "BRM_FMK_pre") exitWith {};
BRM_FMK_pre = true;

if (fileExists "framework\local_version.txt") then { // Mission <= v0.7.5
	private _localVersion = call compile preprocessFileLineNumbers "framework\local_version.txt" splitString "" apply { parseNumber _x };
	for "_i" from count _localVersion to 3 do {
		_localVersion pushBack 0;
	};
	BRM_version = _localVersion;
};

private _cfgMissionVersion = missionConfigFile >> "BRM_Framework" >> "mission_version";
if (isArray _cfgMissionVersion) then { // Mission > v0.7.5
	BRM_version = getArray _cfgMissionVersion;
};

if (isNil "BRM_version") exitWith {}; // Not a BromA Framework mission

if ([BRM_version, [0, 7, 5]] call BRM_FMK_fnc_versionCompare <= 0) then {
	[{ !isNil "mission_settings" && { scriptDone mission_settings } }, {
		if (!mission_enable_side_c) then {
			side_c_faction = "";
		};

		mission_loadout_mods = modified_loadouts;
		mission_loadout_vanillaPlayer = units_player_useVanillaGear;
		mission_loadout_vanillaAI = units_AI_useVanillaGear;

		// This isn't quite correct, but should handle most missions.
		if (units_player_useVanillaGear) then {
			side_a_faction = "VANILLA";
		};
		if (units_AI_useVanillaGear) then {
			side_b_faction = "VANILLA";
			if (side_c_faction != "") then {
				side_c_faction = "VANILLA";
			};
		};
	}] call CBA_fnc_waitUntilAndExecute;
} else {
	[] call BRM_FMK_fnc_initVariables;

	if (hasInterface) then {
		// Remove side-specific markers
		private _playerSide = side player;
		{
			_x params ["_side", "_layerName"];

			if (_playerSide != _side) then {
				{
					deleteMarkerLocal _x;
				} forEach (getMissionLayerEntities _layerName select 1);
			};
		} forEach [[WEST, "BLU"], [EAST, "OP"], [RESISTANCE, "IND"], [CIVILIAN, "CIV"]];
	};

	[] call BRM_FMK_fnc_loadMissionSettings;

	BRM_fnc_onAIKilled = if (fileExists "mission\events\onAIKilled.sqf") then { compile preprocessFileLineNumbers "mission\events\onAIKilled.sqf"; } else { {} };
	BRM_fnc_onPlayerKilled = if (fileExists "mission\events\onPlayerKilled.sqf") then { compile preprocessFileLineNumbers "mission\events\onPlayerKilled.sqf"; } else { {} };
	BRM_fnc_onPlayerRespawn = if (fileExists "mission\events\onPlayerRespawn.sqf") then { compile preprocessFileLineNumbers "mission\events\onPlayerRespawn.sqf"; } else { {} };
};

["LOCAL", "F_LOG", ""] call BRM_FMK_fnc_doLog;
["LOCAL", "F_LOG", format ["STARTING MISSION '%1'", briefingName]] call BRM_FMK_fnc_doLog;
["LOCAL", "F_LOG", ""] call BRM_FMK_fnc_doLog;

startTime = diag_tickTime;
pluginsLoaded = false;

BRM_FMK_plugins = "true" configClasses (configFile >> "BRM_FMK_Plugins") apply { configName _x };
BRM_FMK_plugins sort true;

if ([BRM_version, [0, 7, 5]] call BRM_FMK_fnc_versionCompare <= 0) then {
	BRM_plugins = "true" configClasses (missionConfigFile >> "CfgPlugins") apply { configName _x };
	BRM_plugins sort true;

	{
		missionNamespace setVariable _x;
	} forEach [
		["BRM_FMK_f_cas_cap_fnc_postinit", "BRM_FMK_casualties_cap_fnc_postinit"],
		["BRM_FMK_f_remove_body_fnc_postinit", "BRM_FMK_remove_body_fnc_postinit"],
		["BRM_FMK_f_remove_body_fnc_removeBody", "BRM_FMK_remove_body_fnc_removeBody"],
		["BRM_FMK_f_evade_escape_fnc_reachObject", "BRM_FMK_evade_escape_fnc_reachObject"]
	];
} else {
	private _plugins = if (fileExists "mission\settings\plugins.sqf") then { call compile preprocessFileLineNumbers "mission\settings\plugins.sqf" } else { [] };
	private _unknownPlugins = _plugins apply { _x select 0 } select { !(_x in BRM_FMK_plugins) };
	if (count _unknownPlugins > 0) then {
		["[BromA Framework] Warning: The mission contains unknown plugins in ""mission\settings\plugins.sqf"", %1.", _unknownPlugins joinString ", "] call BIS_fnc_error;
	};

	BRM_plugins = [];
	{
		if ([_plugins, _x, getNumber (configFile >> "BRM_FMK_Plugins" >> _x >> "disabled") == 0] call BIS_fnc_getFromPairs) then {
			BRM_plugins pushBack _x;
		};
	} forEach BRM_FMK_plugins;

	private _preInitArgs = ["preInit"];
	{
		private _plugin = _x;
		{
			if (!isNil _x) then {
				_preInitArgs call (missionNamespace getVariable _x);
			} else {
				["[BromA Framework] Internal Error: Unknown ""%2"" plugin preInit function, %2.", _plugin, _x] call BIS_fnc_error;
			};
		} forEach getArray (configFile >> "BRM_FMK_Plugins" >> _plugin >> "preInit");
	} forEach BRM_plugins;
};
