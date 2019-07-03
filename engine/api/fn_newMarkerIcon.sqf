/*
================================================================================

NAME:
    BRM_FMK_fnc_newMarkerIcon

AUTHOR(s):
    Nife

DESCRIPTION:
    Easier and shorter way to create markers. Makes an icon marker.

PARAMETERS:
    0 - Locality - "global" or "local" (STRING)
    1 - Position. (ARRAY)
    2 - Type: The marker's icon. See https://community.bistudio.com/wiki/cfgMarkers (STRING)
    3 - (OPTIONAL) Color: "ColorRed", "ColorBlue" etc. (STRING)
    4 - (OPTIONAL) Text. (STRING)
    5 - (OPTIONAL) Size: an array with the width and the height, 1 being the default. (ARRAY)
    6 - (OPTIONAL) Direction in degrees. (NUMBER)
    7 - (OPTIONAL) Opacity, from 0 to 1. (NUMBER)

USAGE:
    _mynewMarker = ["global", (getPos player), "hd_flag", "ColorBlue", "Help us!", [1,1], 0, 1] call BRM_FMK_fnc_newMarkerIcon

    _mynewMarker = ["local", (getPos enemy), "hd_warning", "ColorRed", "Enemy infantry", [0.5,0.5], 0, 0.3] call BRM_FMK_fnc_newMarkerIcon

RETURNS:
    Object of the marker created. (MARKER)

================================================================================
*/

params ["_global", "_position", "_type", "_color", "_text", "_size", "_dir", "_alpha"];

[toLower _global == "global", nil, _position, nil, nil, _type, _color, _size, _text, _dir, _alpha] call BRM_FMK_fnc_newMarker;
