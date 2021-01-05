#include "component.hpp"
/*
================================================================================

NAME:
    BRM_fnc_logPlugins

AUTHOR(s):
    Nife

DESCRIPTION:
    Reads and logs all plugins based on their meta-data attributes.

PARAMETERS:
    Nothing.

USAGE:
    [] call BRM_fnc_logPlugins

RETURNS:
    Nothing.

================================================================================
*/

plugins_loaded = false;

usedPlugins = "true" configClasses (missionConfigFile >> "CfgPlugins") apply { configName _x };
usedPlugins sort true;

ENGINE_plugins = configProperties [configFile >> "CfgBRMPlugins", "true", false] apply { configName _x };
ENGINE_plugins sort true;

plugins_loaded = true;

0 spawn {
	waitUntil { !isNil "framework_init_time" };

	private _subject = "BRM_FMK_diary";
	player createDiarySubject [_subject, "BromA Framework"];

	player createDiaryRecord [_subject, ["Framework",
		([
			format ["<font size='16' face='RobotoCondensedBold'>%1 - v%2 (local v%3)</font>",
				getText (configFile >> "CfgPatches" >> QUOTE(MAIN_ADDON) >> "description"),
				getText (configFile >> "CfgPatches" >> QUOTE(MAIN_ADDON) >> "versionStr"),
				call compile preprocessFile "framework\local_version.txt"
			],
			format ["Initialized in %1 seconds.", framework_init_time],
			"",
			"<font face='RobotoCondensedBold'>Plugins:</font>"
		] + (usedPlugins apply {
			private _cfgName = getText (configFile >> "CfgBRMPlugins" >> _x);
			if (_cfgName != "") then {
				private _cfg = configFile >> "CfgPatches" >> _cfgName;
				if (isClass _cfg) then {
					format ["  <execute expression='[""%4"", ""%1 v%2 by %3""] spawn BIS_fnc_guiMessage;'>[?]</execute> <font color='#E6E682'>%1</font>", getText (_cfg >> "name"), getNumber (_cfg >> "version"), [getArray (_cfg >> "authors")] call BRM_FMK_fnc_verboseArray, getText (_cfg >> "description")]
				} else {
					format ["      <font color='#E78484'>Unknown framework plugin: %1 (CfgPatches)</font>", _x]
				};
			} else {
				format ["      <font color='#E78484'>Unknown framework plugin: %1 (CfgBRMPlugin)</font>", _x]
			};
		})) joinString "<br />"
	]];
};
