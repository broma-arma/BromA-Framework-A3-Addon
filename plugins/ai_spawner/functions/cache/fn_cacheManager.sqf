#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_cacheManager

Description:
	Start the cache manager.

Parameters:
	None

Returns:
	Nothing

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

if (!isNil "BRM_FMK_Plugin_AIS_cacheManager") exitWith {};

BRM_FMK_Plugin_AIS_cacheManager = 0 spawn {
	while { true } do {
		private _remove = [];
		private _playableUnits = playableUnits + switchableUnits;
		{
			_y params ["_group", "_cachingDistances"];
			if (isNull _group) then { _remove pushBack _x; continue; };

			private _units = units _group select { alive _x };
			if (count _units < 1) then { _remove pushBack _x; continue; };

			private _leader = leader _group;
			private _cachingDistance = _cachingDistances select !isNull objectParent leader _group;
			private _closeUnits = if (_cachingDistance isEqualType false) then {
				!_cachingDistance
			} else {
				private _distanceSqr = _cachingDistance ^ 2;
				_distanceSqr <= 0 || { _playableUnits findIf { _leader distanceSqr _x <= _distanceSqr } != -1 };
			};

			{
				private _canCache = _leader != _x && { !(assignedVehicleRole _x param [0, ""] in ["driver", "turret"]) };

				if (_x getVariable ["BRM_FMK_Plugin_AIS_cached", false]) then {
					if (_closeUnits || !_canCache) then {
						[_x, false] call BRM_FMK_Plugin_AIS_fnc_cacheUnit;
					};
				} else {
					if (!_closeUnits && _canCache) then {
						[_x, true] call BRM_FMK_Plugin_AIS_fnc_cacheUnit;
					};
				};
			} forEach _units;
		} forEach BRM_FMK_Plugin_AIS_cacheManager_groups;
		{ BRM_FMK_Plugin_AIS_cacheManager_groups deleteAt _x } forEach _remove;

		sleep 5;
	};
};
