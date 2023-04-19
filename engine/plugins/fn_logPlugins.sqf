#include "script_component.hpp"
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

params ["_initTime"];

private _subject = QGVARMAIN(diary);
player createDiarySubject [_subject, "BromA Framework"];

private _plugins = BRM_plugins apply {
	private _cfg = configFile >> QGVARMAIN(Plugins) >> _x;
	format [
		"  <execute expression='hint ""%1 v%2\nby %3\n\n%4""'>[?]</execute> <font color='#E6E682'>%1 v%2</font> by %3.",
		getText ( _cfg >> "name"),
		getNumber ( _cfg >> "version"),
		[getArray ( _cfg >> "authors")] call FUNCMAIN(verboseArray),
		getText ( _cfg >> "description")
	]
};

player createDiaryRecord [_subject, ["Framework",
	([
		format ["<font size='16' face='RobotoCondensedBold'>%1 - v%2 (local v%3)</font>",
			QUOTE(VERSION_DESC),
			QUOTE(VERSION),
			BRM_version joinString "."
		],
		format ["Initialized in %1 seconds.", _initTime],
		"",
		"<font face='RobotoCondensedBold'>Plugins:</font>"
	] + _plugins) joinString "<br />"
]];
