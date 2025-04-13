#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_updateCampsMarkers

Description:
	Update camp markers for a defend spawner.

Parameters:
	_id - Spawner ID [STRING]
	_zone - Zone [OBJECT/GROUP/MARKER/LOCATION/POSITION/WAYPOINT/ARRAY]
	_camps - Camps [ARRAY of ARRAY]
		_camp - Camp [OBJECT/GROUP/MARKER/LOCATION/POSITION/WAYPOINT/ARRAY]
		_type - Group type [STRING]
		_spawns - Spawn count [NUMBER]

Returns:
	Nothing

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

params ["_id", "_zone", "_camps"];

{
	_x params ["_camp", "_type", "_spawns"];

	if (_spawns > 0) then {
		format ["BRM_FMK_Plugin_AIS_ico_%1_%2", _id, _camp] setMarkerText format ["%1 (%2)", _type, _spawns];
	};
} forEach _camps;
