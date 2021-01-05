#include "component.hpp"
/*
================================================================================

NAME:
    BRM_FMK_fnc_showText

AUTHOR(s):
    Nife

DESCRIPTION:
    Shows text in an organized and timed fashion.

PARAMETERS:
    n Screens to display (ARRAY):
        0 - Text to show (STRING)
        1 - Type of title (STRING)
        2 - How long to display (NUMBER)

USAGE:
    [
        ["This is an intro...", "BLACK FADED", 3],
        ["And it just ended!", "PLAIN", 5]
    ] spawn BRM_FMK_fnc_showText

RETURNS:
    All titles have been displayed. (BOOLEAN)

================================================================================
*/

if (_this isEqualType [] && { count _this > 0 }) then {
	{
		_x params [["_text", "", [""]], ["_type", "", [""]], ["_time", 0, [0]]];
		if (_text != "" && _type != "" && _time > 0) then {
			titleText [_text, _type, _time * 0.1];
			sleep _time;
		};
	} forEach _this;
};

true
