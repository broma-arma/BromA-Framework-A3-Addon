#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_stalkSpawner

Description:
	Stalk spawner logic.

Parameters:
	_state - State [NUMBER]
	_id - ID [STRING]
	_spawner - Data [HASHMAP]

Returns:
	Nothing

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

if (!mission_ai_controller) exitWith {};

params ["_state", "_id", "_spawner"];

switch (_state) do {
	case SPAWNER_CREATED: {
		
	};
	case SPAWNER_INIT: {

	};
	case SPAWNER_TICK: {
		private _spawnedTypes = createHashMap;
		private _spawnedGroups = _spawner get "groups";
		private _target = CONFIG_TARGET;
		if (units _target findIf { _x call BRM_FMK_fnc_alive }) exitWith { 30 };

		private _minRadius = CONFIG_SETTINGS select 1/*_safeSpawnDistance*/;
		CONFIG_TYPECONFIG params ["_maxRadius"];
		private _maxRadiusSqr = _maxRadius ^ 2;
		{
			if (isNull _x) then {
				_spawnedGroups deleteAt _forEachIndex;
				continue;
			};

			if (_maxRadiusSqr > 0 && { (getPos leader _x) distance (getPos leader _target) > _maxRadiusSqr }) then {
				{ deleteVehicle _x } forEach units _x;
				deleteGroup _x;
				_spawnedGroups deleteAt _forEachIndex;
				continue;
			};

			if (units _x findIf { alive _x } != -1) then {
				private _groupType = _x getVariable "BRM_FMK_Plugin_AIS_groupType";
				_spawnedTypes set [_groupType, (_spawnedTypes getOrDefault [_groupType, 0]) + 1];
			} else {
				_spawnedGroups deleteAt _forEachIndex;
			};
		} forEachReversed _spawnedGroups;

		private _spawnableTypes = CONFIG_GROUPS select {
			_spawnedTypes getOrDefault [_x select 0, 0] < _x select 1
		};

		private _spawned = false;
		if (count _spawnableTypes > 0) then {
			private _targetPos = _target call BRM_FMK_fnc_getPos;
			{
				private _spawnPosition = [_targetPos, _minRadius, _maxRadius, 2, CONFIG_SETTINGS select 1/*_safeSpawnDistance*/] call BRM_FMK_Plugin_AIS_fnc_findPosition;
				if (_spawnPosition isNotEqualTo []) then {
					if (!_spawned) then {
						CONFIG_EVENT_WAVE_START call { privateAll; [] call _this; };
						_spawned = true;
					};

					_x params ["_type", "", "_waypointSettings"];
					private _group = [_spawnPosition, _spawnPosition getDir _targetPos, _type, CONFIG_SIDE, CONFIG_LOADOUT, CONFIG_SETTINGS] call BRM_FMK_Plugin_AIS_fnc_createGroup;
					[_group, _target] call BRM_FMK_Plugin_AIS_fnc_taskStalk;
					_spawnedGroups pushBack _group;
					_spawner set ["groupCount", (_spawner get "groupCount") + 1];

					CONFIG_EVENT_WAVE_SPAWN call { privateAll; [] call _this; };
				};
			} forEach _spawnableTypes;

			if (_spawned) then {
				CONFIG_EVENT_WAVE_END call { privateAll; [] call _this; };
			};
		};

		[false, CONFIG_WAVE_DELAY] select _spawned
	};
	case SPAWNER_DELETE: {

	};
};
