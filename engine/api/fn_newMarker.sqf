#include "script_component.hpp"
/*
================================================================================

NAME:
    BRM_FMK_fnc_newMarker

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Creates a marker with the specified settings.

PARAMETERS:
    0 - (OPTIONAL) Marker locality - true for global. Default false. (BOOLEAN)
    1 - (OPTIONAL) Name. Default "BRM_FMK_newMarker%d". (ARRAY)
    2 - (OPTIONAL) Position. Default [0, 0]. (ARRAY)
    3 - (OPTIONAL) Shape: "ICON", "RECTANGLE", "ELLIPSE" or "POLYLINE". Default "ICON". (STRING)
    4 - (OPTIONAL) Brush: "Solid", "SolidFull", "Horizontal", "Vertical", "Grid", "FDiagonal", "BDiagonal", "DiagGrid", "Cross", "Border", or "SolidBorder". Default "Solid". (STRING)
    5 - (OPTIONAL) Type: See https://community.bistudio.com/wiki/Arma_3:_CfgMarkers for possible values. Default "". (STRING)
    6 - (OPTIONAL) Color: See https://community.bistudio.com/wiki/Arma_3:_CfgMarkerColors#Marker_Color_Classes for possible values. Default "Default". (STRING)
    7 - (OPTIONAL) Size: an array with half width and half height. Default [1, 1]. (ARRAY)
    8 - (OPTIONAL) Text. Default "". (STRING)
    9 - (OPTIONAL) Direction, in degrees. Default 0. (NUMBER)
   10 - (OPTIONAL) Alpha: 0 to 1, with 0 being transparent. Default 1. (NUMBER)

USAGE:
	// Create a 50% transparent, solid, blue, 500x500 rectangle at the player's position.
    _mynewMarker = [true, nil, player, "RECTANGLE", "Solid", nil, "ColorBlue", [250, 250], nil, 0, 0.5] call BRM_FMK_fnc_newMarker;

	// Create a 50% transparent, cross, red, 500x500 ellipse at the player's position.
    _markerName = [false, nil, player, "ELLIPSE", "Cross", nil, "ColorRed", [250, 250], nil, 0, 0.5] call BRM_FMK_fnc_newMarker

	// Create a opaque, blue, 1x1 hd_flag labeled "Help us!" at the player's position.
    _markerName = [true, nil, player, nil, nil, "hd_flag", "ColorBlue", [1, 1], "Help us!", 0, 1] call BRM_FMK_fnc_newMarker

	// Create a opaque, red, 0.5x0.5 hd_warning labeled "Enemy infantry" at the position of 'enemy'.
    _markerName = [false, nil, enemy, nil, nil, "hd_warning", "ColorRed", [0.5, 0.5], "Enemy infantry", 0, 0.3] call BRM_FMK_fnc_newMarker

RETURNS:
    The created marker's name. (STRING)

================================================================================
*/

params [
	["_global", false, [false]],
	["_name", "", [""]],
	["_pos", [0, 0], [[], objNull], [2, 3]],
	["_shape", "ICON", [""]],
	["_brush", "Solid", [""]],
	["_type", "", [""]],
	["_color", "Default", [""]],
	["_size", [1, 1], [[]], 2],
	["_text", "", [""]],
	["_dir", 0, [0]],
	["_alpha", 1, [1]]
];

if (_name == "") then {
	private _counter = missionNamespace getVariable [QGVAR(newMarker_index), 0];
	_name = format [QGVAR(newMarker%1), _counter];
	missionNamespace setVariable [QGVAR(newMarker_index), _counter + 1];
};

createMarkerLocal [_name, _pos];
if (_shape != "ICON") then { _name setMarkerShapeLocal _shape; };
if (_brush != "Solid") then { _name setMarkerBrushLocal _brush; };
if (_type != "") then { _name setMarkerTypeLocal _type; };
if (_color != "") then { _name setMarkerColorLocal _color; };
if (_size isNotEqualTo [1, 1]) then { _name setMarkerSizeLocal _size; };
if (_text != "") then { _name setMarkerTextLocal _text; };
if (_dir != 0) then { _name setMarkerDirLocal _dir; };

if (_global) then {
	_name setMarkerAlpha _alpha;
} else {
	if (_alpha != 1) then {
		_name setMarkerAlphaLocal _alpha;
	};
};

_name
