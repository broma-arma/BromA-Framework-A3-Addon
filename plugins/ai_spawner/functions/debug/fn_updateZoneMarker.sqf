#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_updateZoneMarker

Description:
	Update markers for a zone.

Parameters:
	_id - Spawner ID [STRING]
	_zone - Zone [TRIGGER]

Returns:
	Nothing

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

params ["_id", "_zone"];

private _groups = GET_SPAWNER(_id) get "groups";

private _totalUnits = 0;
private _activeUnits = 0;
{
	{
		if (alive _x) then {
			_totalUnits = _totalUnits + 1;
			if !(_x getVariable ["BRM_FMK_Plugin_AIS_cached", false]) then {
				_activeUnits = _activeUnits + 1;
			};
		};
	} forEach units _x;
} forEach _groups;

format ["BRM_FMK_Plugin_AIS_ico_%1_%2", _id, _zone] setMarkerText format [
	"%1 (%2,%3/%4)",
	_id,
	count _groups,
	_activeUnits,
	_totalUnits
];
