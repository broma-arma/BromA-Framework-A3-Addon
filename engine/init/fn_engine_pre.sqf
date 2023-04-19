#include "script_component.hpp"
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

if (!isNil QGVAR(pre)) exitWith {};
GVAR(pre) = true;

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

if ([BRM_version, [0, 7, 5]] call FUNCMAIN(versionCompare) <= 0) then {
	[{ !isNil "mission_settings_loaded" && {mission_settings_loaded} }, {
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
	[] call FUNCMAIN(initVariables);

	[] call FUNCMAIN(loadMissionSettings);

	BRM_fnc_onAIKilled = if (fileExists "scripts\onAIKilled.sqf") then { compile preprocessFileLineNumbers "scripts\onAIKilled.sqf"; } else { {} };
	BRM_fnc_onPlayerKilled = if (fileExists "scripts\onPlayerKilled.sqf") then { compile preprocessFileLineNumbers "scripts\onPlayerKilled.sqf"; } else { {} };
	BRM_fnc_onPlayerRespawn = if (fileExists "scripts\onPlayerRespawn.sqf") then { compile preprocessFileLineNumbers "scripts\onPlayerRespawn.sqf"; } else { {} };
};

["LOCAL", "F_LOG", ""] call FUNCMAIN(doLog);
["LOCAL", "F_LOG", format ["STARTING MISSION '%1'", briefingName]] call FUNCMAIN(doLog);
["LOCAL", "F_LOG", ""] call FUNCMAIN(doLog);

startTime = diag_tickTime;
pluginsLoaded = false;

GVARMAIN(plugins) = "true" configClasses (configFile >> QGVARMAIN(Plugins)) apply { configName _x };
GVARMAIN(plugins) sort true;

if ([BRM_version, [0, 7, 5]] call FUNCMAIN(versionCompare) <= 0) then {
	BRM_plugins = "true" configClasses (missionConfigFile >> "CfgPlugins") apply { configName _x };
	BRM_plugins sort true;

	{
		missionNamespace setVariable _x;
	} forEach [
		[QEFUNC(f_cas_cap,postinit), EFUNC(casualties_cap,postinit)],
		[QEFUNC(f_remove_body,postinit), EFUNC(remove_body,postinit)],
		[QEFUNC(f_remove_body,removeBody), EFUNC(remove_body,removeBody)],
		[QEFUNC(f_evade_escape,reachObject), EFUNC(evade_escape,reachObject)]
	];
} else {
	private _unknownPlugins = mission_plugins apply { _x select 0 } select { !(_x in GVARMAIN(plugins)) };
	if (count _unknownPlugins > 0) then {
		["[BromA Framework] Warning: The mission contains unknown plugins in ""settings\settings.sqf"", %1.", _unknownPlugins joinString ", "] call BIS_fnc_error;
	};

	BRM_plugins = [];
	{
		if ([mission_plugins, _x, getNumber (configFile >> QGVARMAIN(Plugins) >> _x >> "disabled") == 0] call BIS_fnc_getFromPairs) then {
			BRM_plugins pushBack _x;
		};
	} forEach GVARMAIN(plugins);

	private _preInitArgs = ["preInit"];
	{
		private _plugin = _x;
		{
			private _fnc = missionNamespace getVariable _x;
			if (!isNil "_fnc" && { _fnc isEqualType {} }) then {
				_preInitArgs call _fnc;
			} else {
				["[BromA Framework] Internal Error: Unknown ""%2"" plugin preInit function, %2.", _plugin, _x] call BIS_fnc_error;
			};
		} forEach getArray (configFile >> QGVARMAIN(Plugins) >> _plugin >> "preInit");
	} forEach BRM_plugins;
};
