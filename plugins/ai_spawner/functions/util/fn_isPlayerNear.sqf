#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_isPlayerNear

Description:
	Get if a player is within a specified radius of a position.

Parameters:
	_position - Center position to search at [OBJECT/GROUP/MARKER/LOCATION/POSITION/WAYPOINT/ARRAY]
	_radius - Radius to check [NUMBER]

Returns:
	true if a player is within the radius from the position, otherwise false [BOOLEAN]

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

params ["_position", "_radius"];

private _pos = _position call BRM_FMK_fnc_getPos select [0, 2];
private _radiusSqr = _radius ^ 2;

allPlayers findIf { getPosASL _x select [0, 2] vectorDistanceSqr _pos <= _radiusSqr } != -1
