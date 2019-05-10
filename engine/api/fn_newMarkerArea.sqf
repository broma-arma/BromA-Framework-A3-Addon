/*
================================================================================

NAME:
    BRM_FMK_fnc_newMarkerArea

AUTHOR(s):
    Nife

DESCRIPTION:
    Easier and shorter way to create markers. Makes an area marker.

PARAMETERS:
    0 - Locality - "global" or "local" (STRING)
    1 - Position. (ARRAY)
    2 - Type: The area type - "RECTANGLE" or "ELLIPSE" (STRING)
    3 - Brush: Fill: see https://community.bistudio.com/wiki/setMarkerBrush (STRING)
    4 - (OPTIONAL) Color: "ColorRed", "ColorBlue" etc. (STRING)
    5 - (OPTIONAL) Size: an array with the width and the height, 1 being the default. (ARRAY)
    6 - (OPTIONAL) Direction in degrees. (NUMBER)
    7 - (OPTIONAL) Opacity, from 0 to 1. (NUMBER)

USAGE:
    _mynewMarker = ["global", (getPos player), "RECTANGLE", "Solid", "ColorBlue", [250,250], 0, 0.5] call BRM_FMK_fnc_newMarkerArea

    _mynewMarker = ["local", (getPos player), "ELLIPSE", "Cross", "ColorRed", [250,250], 0, 0.5] call BRM_FMK_fnc_newMarkerArea

RETURNS:
    Object of the marker created. (MARKER)

================================================================================
*/

params ["_global", "_position", "_shape", "_brush", "_color", "_size", "_dir", "_alpha"];

[toLower _global == "global", nil, _position, _shape, _brush, nil, _color, _size, nil, _dir, _alpha] call BRM_FMK_fnc_newMarker;
