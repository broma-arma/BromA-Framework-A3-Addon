#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_attackSpawner

Description:
	Attack spawner logic.

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
		if (BRM_FMK_Plugin_AIS_debug) then {
			[_id, CONFIG_TARGET, CONFIG_TYPECONFIG select 0] spawn BRM_FMK_Plugin_AIS_fnc_createAttackMarkers;
		};
	};
	//case SPAWNER_INIT: {};
	case SPAWNER_TICK: {
		private _spawnedTypes = createHashMap;
		private _spawnedGroups = _spawner get "groups";
		{
			if (isNull _x) then {
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
			CONFIG_TYPECONFIG params [["_spawnPositions", [], [[]]]];

			_spawnPositions = _spawnPositions select {
				!([_x, CONFIG_SETTINGS select 1/*_safeSpawnDistance*/] call BRM_FMK_Plugin_AIS_fnc_isPlayerNear)
			};

			if (count _spawnPositions > 0) then {
				_spawned = true;
				CONFIG_EVENT_WAVE_START call { privateAll; [] call _this; };

				private _targetPos = CONFIG_TARGET call BRM_FMK_fnc_getPos;
				{
					_x params ["_type", "", "_waypointSettings"];

					private _count = count _spawnPositions;
					private _spawnPosition = (_spawnPositions deleteAt floor random _count) call BRM_FMK_fnc_getPos select [0, 2];

					private _group = [_spawnPosition, _spawnPosition getDir _targetPos, _type, CONFIG_SIDE, CONFIG_LOADOUT, CONFIG_SETTINGS] call BRM_FMK_Plugin_AIS_fnc_createGroup;
					[_group, _targetPos, _waypointSettings, CONFIG_EVENT_WAYPOINT] spawn BRM_FMK_Plugin_AIS_fnc_taskAttack;
					_spawnedGroups pushBack _group;
					_spawner set ["groupCount", (_spawner get "groupCount") + 1];

					CONFIG_EVENT_WAVE_SPAWN call { privateAll; [] call _this; };

					if (_count == 1) then { break; };
				} forEach _spawnableTypes;

				CONFIG_EVENT_WAVE_END call { privateAll; [] call _this; };
			};
		};

		[false, CONFIG_WAVE_DELAY] select _spawned
	};
	//case SPAWNER_DELETE: {};
};
