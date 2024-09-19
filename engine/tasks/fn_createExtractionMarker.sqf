/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_createExtractionMarker

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Create an extraction marker.

PARAMETERS:
    0 - Object to add the item to. (SIDE)
    1 - Position. (ARRAY)
    2 - Direction in degrees. (NUMBER)
    3 - Color: "ColorRed", "ColorBlue" etc. (STRING)
    4 - Text. (STRING)

USAGE:
    [WEST, [1000, 1000], 0, "ColorBLUFOR", "Extraction #1"] call BRM_FMK_Engine_fnc_createExtractionMarker;

RETURNS:
    Nothing.

================================================================================
*/

params ["_side", "_pos", "_dir", "_color", "_text"];

if !(hasInterface) exitWith {};

if (isNull player) exitWith {
	[{ !isNull player }, { _this call BRM_FMK_Engine_fnc_createExtractionMarker; }, _this] call CBA_fnc_waitUntilAndExecute;
};

if (side player == _side) then {
	["local", _pos, "mil_end", _color, _text, [1, 1], _dir + 180, 1] call BRM_FMK_fnc_newMarkerIcon;
};
