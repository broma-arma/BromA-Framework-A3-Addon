/*
================================================================================

NAME:
    BRM_FMK_fnc_colorToHex
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Converts a CfgMarkerColors name to its hexadecimal equivalent.
    
PARAMETERS:
    0 - Color name (STRING)
        black, grey, red, brown, orange, yellow, khaki, green, blue, pink, white,
        west, east, guer, civ, unknown, blufor, opfor, independent, civilian,
        or another CfgMarkerColors classname without the 'Color' prefix

USAGE:
    myColor = ["red"] call BRM_FMK_fnc_colorToHex
    
RETURNS:
    Color hex code (STRING)

================================================================================
*/

params [["_color", "", [""]]];

private _cfg = if (_color != "") then {
	[["CfgMarkerColors", "Color" + _color, "color"], configNull] call BIS_fnc_loadEntry
} else {
	configNull
};
if (isNull _cfg) exitWith {
	"#FFFFFF"
};

_cfg call BIS_fnc_colorConfigToRGBA call BIS_fnc_colorRGBtoHTML
