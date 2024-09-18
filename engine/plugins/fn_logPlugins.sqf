/*
================================================================================

NAME:
    BRM_FMK_fnc_logPlugins

AUTHOR(s):
    Nife

DESCRIPTION:
    Reads and logs all plugins based on their meta-data attributes.

PARAMETERS:
    Nothing.

USAGE:
    [] call BRM_FMK_fnc_logPlugins

RETURNS:
    Nothing.

================================================================================
*/

plugins_loaded = false;

BRM_FMK_activePlugins = "true" configClasses (missionConfigFile >> "CfgPlugins") apply { configName _x };

BRM_FMK_activePlugins deleteAt (BRM_FMK_activePlugins find "agm_plugin"); // Remove agm_plugin.

0 call {
	if (isClass (configFile >> "CfgPatches" >> "ace_spectator")) then {
		// Force ACE3 Spectator, instead of Vanilla Spectator
		private _i = BRM_FMK_activePlugins find "vanilla_spectator";
		if (_i != -1 && !("ace3_spectator" in BRM_FMK_activePlugins)) then {
			BRM_FMK_activePlugins set [_i, "ace3_spectator"];
			[{ !isNil "mission_game_mode" && !isNil "player_is_spectator" }, { [] call BRM_FMK_ACE3_SPECTATOR_fnc_postinit; }] call CBA_fnc_waitUntilAndExecute;
		};
	};
};

BRM_FMK_activePlugins sort true;
usedPlugins = BRM_FMK_activePlugins; // Backward compatibility

plugins_loaded = true;

0 spawn {
	waitUntil { !isNil "framework_init_time" };

	private _subject = "BRM_FMK_diary";
	player createDiarySubject [_subject, "BromA Framework"];

	private _plugins = BRM_FMK_activePlugins apply {
		private _cfg = configFile >> "CfgBRMPlugins" >> _x;
		format [
			"  <execute expression='hint ""%1 v%2\nby %3\n\n%4""'>[?]</execute> <font color='#E6E682'>%1 v%2</font> by %3.",
			getText ( _cfg >> "name"),
			getNumber ( _cfg >> "version"),
			[getArray ( _cfg >> "authors")] call BRM_FMK_fnc_verboseArray,
			getText ( _cfg >> "description")
		]
	};

	player createDiaryRecord [_subject, ["Framework",
		([
			format ["<font size='16' face='RobotoCondensedBold'>%1 - v%2 (local v%3)</font>",
				getText (configFile >> "CfgPatches" >> "BRM_FRAMEWORK" >> "versionDesc"),
				getText (configFile >> "CfgPatches" >> "BRM_FRAMEWORK" >> "version"),
				call compile preprocessFile "framework\local_version.txt"
			],
			format ["Initialized in %1 seconds.", framework_init_time],
			"",
			"<font face='RobotoCondensedBold'>Plugins:</font>"
		] + _plugins) joinString "<br />"
	], taskNull, "NONE", false];
};
