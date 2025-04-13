#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_createZoneMarker

Description:
	Create markers for a zone.

Parameters:
	_id - Spawner ID [STRING]
	_zone - Zone [TRIGGER]
	_alpha - Marker alpha [NUMBER, defaults to 0.25]

Returns:
	Nothing

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

params ["_id", "_zone", ["_alpha", 0.25]];

triggerArea _zone params ["_areaX", "_areaY", "_angle", "_isRectangle"];

private _side = SPAWNER_CONFIG(_id,CONFIG_INDEX_SIDE);
[true, format ["BRM_FMK_Plugin_AIS_mrk_%1_%2", _id, _zone], getPos _zone, ["ELLIPSE", "RECTANGLE"] select _isRectangle, nil, nil, [_side, true] call BIS_fnc_sideColor, [_areaX, _areaY], nil, _angle, _alpha] call BRM_FMK_fnc_newMarker;
[true, format ["BRM_FMK_Plugin_AIS_ico_%1_%2", _id, _zone], _zone call BRM_FMK_fnc_getPos, nil, nil, "mil_dot", [_side, true] call BIS_fnc_sideColor] call BRM_FMK_fnc_newMarker;
