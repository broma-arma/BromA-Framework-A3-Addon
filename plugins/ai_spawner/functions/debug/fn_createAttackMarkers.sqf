#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_createAttackMarkers

Description:
	Create markers for an attack spawner.

Parameters:
	_id - Spawner ID [STRING]
	_attackPosition - Attack position [OBJECT/GROUP/MARKER/LOCATION/POSITION/WAYPOINT/ARRAY]
	_spawnPositions - Spawn positions [ARRAY of OBJECT/GROUP/MARKER/LOCATION/POSITION/WAYPOINT/ARRAY]

Returns:
	Nothing

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

params ["_id", "_attackPosition", "_spawnPositions"];

private _color = [SPAWNER_CONFIG(_id,CONFIG_INDEX_SIDE), true] call BIS_fnc_sideColor;

{
	private _icon = ["loc_move", "mil_dot"] select (_forEachIndex == 0);
	if (_forEachIndex != 0) then {
		[_id, _x, _attackPosition, _color] call BRM_FMK_Plugin_AIS_fnc_createLineMarker;
	};

	private _marker = format ["BRM_FMK_Plugin_AIS_%1_%2", _id, _x];
	if (getMarkerType _marker == "") then {
		[true, _marker, _x call BRM_FMK_fnc_getPos select [0, 2], "ICON", nil, _icon, _color] call BRM_FMK_fnc_newMarker;
	};
} forEach [_attackPosition] + _spawnPositions;
