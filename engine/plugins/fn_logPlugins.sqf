/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_logPlugins

AUTHOR(s):
    Nife

DESCRIPTION:
    Reads and logs all plugins based on their meta-data attributes.

PARAMETERS:
    Nothing.

USAGE:
    [] call BRM_FMK_Engine_fnc_logPlugins

RETURNS:
    Nothing.

================================================================================
*/

BRM_FMK_Engine_activePlugins = "true" configClasses (missionConfigFile >> "CfgPlugins") apply { configName _x } select { isClass (configFile >> "BRM_FMK" >> "Plugins" >> _x) };

if (isClass (configFile >> "CfgPatches" >> "ace_spectator")) then {
	// Force ACE3 Spectator, instead of Vanilla Spectator
	private _i = BRM_FMK_Engine_activePlugins find "vanilla_spectator";
	if (_i != -1 && !("ace3_spectator" call BRM_FMK_fnc_isPluginActive)) then {
		BRM_FMK_Engine_activePlugins set [_i, "ace3_spectator"];
		[{ !isNil "mission_game_mode" && !isNil "player_is_spectator" }, { [] call BRM_FMK_Plugin_ACE3Spectator_fnc_postInit; }] call CBA_fnc_waitUntilAndExecute;
	};
};

BRM_FMK_Engine_activePlugins sort true;
usedPlugins = +BRM_FMK_Engine_activePlugins; // Backward compatibility

private _pluginConflicts = [];
{
	private _conflicts = getArray (configFile >> "BRM_FMK" >> "Plugins" >> _x >> "conflict_plugins") select { _x call BRM_FMK_fnc_isPluginActive };
	if (count _conflicts > 0) then {
		_pluginConflicts pushBack format ["  %1: %2", _x, [_conflicts] call BRM_FMK_fnc_verboseArray];
	}
} forEach BRM_FMK_Engine_activePlugins;
if (count _pluginConflicts > 0) then {
	"BromA Framework - Plugin Conflict" hintC ["The following plugins are conflicted:"] + _pluginConflicts;
	["LOCAL", "LOG", "ERROR - BromA Framework - The following plugins are conflicted:"] call BRM_FMK_fnc_doLog;
	{
		["LOCAL", "LOG", _x] call BRM_FMK_fnc_doLog;
	} forEach _pluginConflicts;
};

if (hasInterface) then {
	["BRM_FMK_Engine_initialized", {
		private _plugins = BRM_FMK_Engine_activePlugins apply {
			private _cfg = configFile >> "BRM_FMK" >> "Plugins" >> _x;
			format [
				"  <execute expression='hint ""%1 v%2\nby %3\n\n%4""'>[?]</execute> <font color='#E6E682'>%1 v%2</font> by %3.",
				getText ( _cfg >> "name"),
				getNumber ( _cfg >> "version"),
				[getArray ( _cfg >> "authors")] call BRM_FMK_fnc_verboseArray,
				getText ( _cfg >> "description")
			]
		};

		player createDiaryRecord ["BRM_FMK_diary", ["Framework",
			([
				format ["<font size='16' face='RobotoCondensedBold'>%1 - v%2 (local v%3)</font>",
					getText (configFile >> "CfgPatches" >> "BRM_FRAMEWORK" >> "versionDesc"),
					getText (configFile >> "CfgPatches" >> "BRM_FRAMEWORK" >> "version"),
					call compile preprocessFile "framework\local_version.txt"
				],
				format ["Initialized in %1 seconds.", BRM_FMK_Engine_initTime],
				"",
				"<font face='RobotoCondensedBold'>Plugins:</font>"
			] + _plugins) joinString "<br />"
		], taskNull, "NONE", false];
	}] call CBA_fnc_addEventHandler;
};
