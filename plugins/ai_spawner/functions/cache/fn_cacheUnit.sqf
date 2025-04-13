#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_cacheUnit

Description:
	Set cache state of a unit.

Parameters:
	_unit - Unit [OBJECT]
	_cache - true to cache, false to uncache [BOOLEAN, defaults to false]

Returns:
	Nothing

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

params [["_unit", objNull, [objNull]], ["_cache", false, [false]]];

if (isNull _unit) exitWith { ["Null unit"] call BIS_fnc_error; };

[_unit, _cache] call BRM_FMK_fnc_disableObject;

if (isNull objectParent _unit) then {
	if (!_cache) then {
		_unit setVehiclePosition [formationPosition _unit, [], 0, "NONE"];
	};
};

_unit setVariable ["BRM_FMK_Plugin_AIS_cached", _cache];
