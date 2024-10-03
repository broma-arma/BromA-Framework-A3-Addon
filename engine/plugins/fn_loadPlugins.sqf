/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_loadPlugins

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Loads framework plugins.

PARAMETERS:
    0 - "preInit" or "postInit". (STRING)
    1 - (OPTIONAL) "postInit" only: didJIP. (BOOLEAN)

USAGE:
    ["preInit"] call BRM_FMK_Engine_fnc_loadPlugins;
    ["postInit", didJIP] call BRM_FMK_Engine_fnc_loadPlugins;

RETURNS:
    Nothing.

================================================================================
*/

params ["_init"];

if (_init == "preInit") exitWith {
	if (BRM_FMK_Engine_compatVersion == 0) then {
		BRM_FMK_Engine_activePluginConfigs = "true" configClasses (configFile >> "BRM_FMK" >> "Plugins") select { isClass (missionConfigFile >> "CfgPlugins" >> configName _x) };
	} else {
		private _activePlugins = getArray (missionConfigFile >> "BRM_FMK" >> "missionPlugins") select [1];
		BRM_FMK_Engine_activePluginConfigs = "true" configClasses (configFile >> "BRM_FMK" >> "Plugins") select { configName _x in _activePlugins };
	};
	BRM_FMK_Engine_activePlugins = BRM_FMK_Engine_activePluginConfigs apply { configName _x };

	if (isClass (configFile >> "CfgPatches" >> "ace_spectator")) then {
		// Force ACE3 Spectator, instead of Vanilla Spectator
		private _i = BRM_FMK_Engine_activePlugins find "vanilla_spectator";
		if (_i != -1 && !("ace3_spectator" call BRM_FMK_fnc_isPluginActive)) then {
			BRM_FMK_Engine_activePlugins set [_i, "ace3_spectator"];
			[{ !isNil "mission_game_mode" && !isNil "player_is_spectator" }, { [] call BRM_FMK_Plugin_ACE3Spectator_fnc_postInit; }] call CBA_fnc_waitUntilAndExecute;
		};
	};

	private _pluginConflicts = [];
	{
		private _conflicts = getArray (configFile >> "BRM_FMK" >> "Plugins" >> _x >> "conflict_plugins") select { _x call BRM_FMK_fnc_isPluginActive };
		if (count _conflicts > 0) then {
			BRM_FMK_Engine_activePlugins deleteAt _forEachIndex;
			_pluginConflicts pushBack format ["  %1: %2", _x, [_conflicts] call BRM_FMK_fnc_verboseArray];
		}
	} forEachReversed BRM_FMK_Engine_activePlugins;
	if (count _pluginConflicts > 0) then {
		private _error = "The following plugins were not activated, due to conflicting with other active plugins:";
		"BromA Framework - Plugin Conflict" hintC [_error] + _pluginConflicts;
		["LOCAL", "LOG", "ERROR - BromA Framework - " + _error] call BRM_FMK_fnc_doLog;
		{
			["LOCAL", "LOG", _x] call BRM_FMK_fnc_doLog;
		} forEach _pluginConflicts;
	};

	BRM_FMK_Engine_activePlugins sort true;
	usedPlugins = +BRM_FMK_Engine_activePlugins; // Backward compatibility

	// Plugins preInit
	{
		private _fnc = missionNamespace getVariable format ["%1_fnc_preInit", [_x, "tag", format ["BRM_FMK_Plugin_%1", configName _x]] call BIS_fnc_returnConfigEntry];
		if (!isNil "_fnc") then {
			_this call _fnc;
		};
	} forEach BRM_FMK_Engine_activePluginConfigs;
};

// Plugins postInit
{
	private _fnc = missionNamespace getVariable format ["%1_fnc_postInit", [_x, "tag", format ["BRM_FMK_Plugin_%1", configName _x]] call BIS_fnc_returnConfigEntry];
	if (!isNil "_fnc") then {
		_this call _fnc;
	};
} forEach BRM_FMK_Engine_activePluginConfigs;

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
					BRM_FMK_Engine_missionVersion
				],
				format ["Initialized in %1 seconds.", BRM_FMK_Engine_initTime],
				"",
				"<font face='RobotoCondensedBold'>Plugins:</font>"
			] + _plugins) joinString "<br />"
		], taskNull, "NONE", false];
	}] call CBA_fnc_addEventHandler;
};
