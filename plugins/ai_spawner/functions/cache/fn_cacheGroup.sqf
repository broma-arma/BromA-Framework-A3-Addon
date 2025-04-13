#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_cacheGroup

Description:
	Add a group to the cache manager.

Parameters:
	_group - Group to cache [GROUP]
	_cachingDistances - Unit cache distances [ARRAY]
		_infantryDistance - Not in a vehicle, false to disable caching [NUMBER/BOOLEAN]
		_vehicleDistance - In a vehicle, false to disable caching [NUMBER/BOOLEAN]

Returns:
	Nothing

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

params [["_group", grpNull, [grpNull]], ["_cachingDistances", [false, false], [[]], [2]]];

if (!isNull _group && _cachingDistances isNotEqualTo [false, false]) then {
	BRM_FMK_Plugin_AIS_cacheManager_groups set [hashValue _group, [_group, _cachingDistances]];

	if (isNil "BRM_FMK_Plugin_AIS_cacheManager") then {
		call BRM_FMK_Plugin_AIS_fnc_cacheManager;
	};
};
