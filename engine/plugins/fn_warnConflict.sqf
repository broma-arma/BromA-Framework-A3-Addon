#include "script_component.hpp"
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
	waitUntil { !isNil "plugins_loaded" && {plugins_loaded} };

	{
		private _conflicts = getArray (configFile >> QGVARMAIN(Plugins) >> _x >> "conflict_plugins") select { _x in BRM_plugins };

		if (count _conflicts > 0) then {
			sleep 0.1;
			private _title = "ERROR - Framework Plugin Conflict";
			private _message = format ["The plugin %1 has a conflict with the following plugins:", _x];
			_title hintC ([_message] + _conflicts);
			["LOCAL", "LOG", format ["%1: %2 %3", _title, _message, [_conflicts] call FUNCMAIN(verboseArray)]] call FUNCMAIN(doLog);
		};
	} forEach BRM_plugins;
};
