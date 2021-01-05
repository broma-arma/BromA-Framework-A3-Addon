#include "component.hpp"
/*
================================================================================

NAME:
    BRM_fnc_warnConflict

AUTHOR(s):
    Nife

DESCRIPTION:
    Finds if any plugins declared in the plugin's "conflict_plugins"
    are enabled, and then displays a warning to the user.

PARAMETERS:
    None.

USAGE:
    [] call BRM_fnc_warnConflict;

RETURNS:
    Nothing.

================================================================================
*/

0 spawn {
	waitUntil { !isNil "plugins_loaded" && { plugins_loaded } };

	{
		private _cfgName = getText (configFile >> "CfgBRMPlugins" >> _x);
		if (_cfgName != "") then {
			private _cfg = configFile >> "CfgPatches" >> _cfgName;
			if (isClass _cfg) then {
				private _conflicts = getArray (_cfg >> "conflict_plugins") select { _x in usedPlugins };
				if (count _conflicts > 0) then {
					private _title = "ERROR - Framework Plugin Conflict";
					private _message = format ["The plugin %1 has a conflict with the following plugins:", _x];
					[([_message] + _conflicts) joinString "<br />", _title] call BIS_fnc_guiMessage;
					["LOCAL", "LOG", format ["%1: %2 %3", _title, _message, [_conflicts] call BRM_FMK_fnc_verboseArray]] call BRM_FMK_fnc_doLog;
				};
			};
		};
	} forEach usedPlugins;
};
