#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_createCampsMarkers

Description:
	Create camp markers for a defend spawner.

Parameters:
	_id - Spawner ID [STRING]
	_zone - Zone [OBJECT/GROUP/MARKER/LOCATION/POSITION/WAYPOINT/ARRAY]
	_camps - Camps [ARRAY of ARRAY]
		_camp - Camp [OBJECT/GROUP/MARKER/LOCATION/POSITION/WAYPOINT/ARRAY]

Returns:
	Nothing

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

params ["_id", "_zone", "_camps"];

private _color = [SPAWNER_CONFIG(_id,CONFIG_INDEX_SIDE), true] call BIS_fnc_sideColor;

{
	_x params ["_camp"];

	private _position = _camp call BRM_FMK_fnc_getPos;
	[true, format ["BRM_FMK_Plugin_AIS_ico_%1_%2", _id, _camp], _position, nil, nil, "loc_move", _color] call BRM_FMK_fnc_newMarker;
	[_id, _position, _zone, _color] call BRM_FMK_Plugin_AIS_fnc_createLineMarker;
} forEach _camps;
