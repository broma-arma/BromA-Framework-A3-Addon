#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_createLineMarker

Description:
	Create a line marker on the map.

Parameters:
	_id - Spawner ID [STRING]
	_start - Start position [OBJECT/GROUP/MARKER/LOCATION/POSITION/WAYPOINT/ARRAY]
	_end - End position [OBJECT/GROUP/MARKER/LOCATION/POSITION/WAYPOINT/ARRAY]
	_color - Color, see https://community.bistudio.com/wiki/Arma_3:_CfgMarkerColors#Marker_Color_Classes [STRING]

Returns:
	Created marker [MARKER]

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

params ["_id", "_start", "_end", ["_color", "Default", [""]]];

_start = _start call BRM_FMK_fnc_getPos select [0, 2];
_end = _end call BRM_FMK_fnc_getPos select [0, 2];

private _marker = [true, format ["BRM_FMK_Plugin_AIS_line2_%1_%2_%3", _id, _start, _end], _start, "POLYLINE", nil, nil, _color] call BRM_FMK_fnc_newMarker;
_marker setMarkerPolyline _start + _end;
_marker
