// TODO Merge attack, defense, and stalk spawner code into a single function.
diag_log text format ["%1: %2", _fnc_scriptName, _this];

if (!mission_ai_controller) exitWith {};

params [
	"_id",
	"_side",
	"_positions",
	"_groupType",
	"_conditions",
	"_groupTotal",
	"_startDelay",
	"_waveDelay",
	"_loadout",
	"_waypointSettings",
	"_events",
	"_settings"
];

_conditions params ["_startCondition", "_endCondition"];
_positions params ["_spawnPositions", "_attackPosition"];
_events params ["_eventStart", "_eventEnd", "_eventEachWave", "_eventEndWaypoint"];

_eventStart = if (_eventStart isEqualType "") then { compile _eventStart } else { _eventStart };
_eventEnd = if (_eventEnd isEqualType "") then { compile _eventEnd } else { _eventEnd };
_eventEachWave = if (_eventEachWave isEqualType "") then { compile _eventEachWave } else { _eventEachWave };

_settings = [BRM_FMK_AIS_spawnerSettings, _settings] call BIS_fnc_getFromPairs;
_settings params ["_cleanup", "_safeSpawnDistance", "_disableLAMBS", "_aiAggressive", "_caching", "_cachingDistances", "_aiSkill"];

private _spawnedGroups = [];
private _spawnCount = 0;
private _spawnLimit = -1;
private _spawnerType = ["ATTACK", "STALK"] select (_attackPosition isEqualType grpNull);
private _spawnRadius = [0, _spawnPositions] select (_spawnerType == "STALK" && _spawnPositions isEqualType 0);
private _groupSize = [_groupType] call BRM_FMK_AIS_fnc_countGroupType;
private _unitTotal = _groupSize * _groupTotal;

waitUntil _startCondition;

sleep _startDelay;

if (_endCondition isEqualType 0) then {
	_spawnLimit = _endCondition;
	_endCondition = { _spawnLimit != -1 && { _spawnCount > _spawnLimit } };
};

BRM_FMK_AIS_Spawners pushBack [
	_id,
	_spawnerType, // "ATTACK", "STALK"
	_spawnedGroups, // [[_groupType, _group], ...]
	_spawnCount, // Total number of groups spawned
	_spawnLimit, // Max number of groups that can be spawned (-1 for no limit)
	_unitTotal, // Max number of units that can be active
	_groupTotal, // Max number of groups that can be active
	_side, // Side
	_loadout, // Loadout
	_cleanup, // Auto-cleanup
	_conditions // Spawner start and end conditions
];

if (BRM_FMK_AIS_debug) then {
	[_id, _positions] spawn BRM_FMK_AIS_fnc_createAttackMarkers;
};

_spawnPositions = _spawnPositions apply {
	[_x] call BRM_FMK_AIS_fnc_toPosition;
};

_attackPosition = [_attackPosition] call BRM_FMK_AIS_fnc_toPosition;

while {!call _endCondition} do {
	{
		if (_spawnLimit != -1 && { _spawnCount > _spawnLimit }) exitWith {};

		waitUntil {
			private _activeUnits = 0;

			// TODO Is this needed, should the end condition support being modified?
			_endCondition = (([_id] call BRM_FMK_AIS_fnc_getSpawner) select BRM_FMK_AIS_SPAWNER_CONDITIONS) select 1;
			if (_endCondition isEqualType 0) then {
				_spawnLimit = _endCondition;
				_endCondition = { _spawnLimit != -1 && { _spawnCount > _spawnLimit } };
			};

			{
				_x params ["_type", "_group"];

				private _unitCount = {alive _x} count units _group;
				if (_unitCount == 0) then {
					_spawnedGroups = _spawnedGroups - [_x];
					_groupTotal = _groupTotal - 1;
				};

				_activeUnits = _activeUnits + _unitCount;
			} forEach _spawnedGroups;

			[_id, [
				[BRM_FMK_AIS_SPAWNER_GROUPS, _spawnedGroups],
				[BRM_FMK_AIS_SPAWNER_SPAWN_COUNT, _spawnCount], // TODO Why is this updated here? (Used in fnc_spawnersInfo)
				[BRM_FMK_AIS_SPAWNER_UNIT_TOTAL, _unitTotal], // TODO Why is this updated, it isn't modified here. (Used in fnc_spawnersInfo)
				[BRM_FMK_AIS_SPAWNER_GROUP_TOTAL, _groupTotal] // TODO Not used anywhere, potentially for use in fnc_spawnersInfo
			]] call BRM_FMK_AIS_fnc_updateSpawner;

			sleep 0.05;

			_activeUnits + _groupSize <= _unitTotal || call _endCondition
		};

		if (call _endCondition) exitWith {};

		private _spawnPosition = _x;
		if !([_spawnPosition, _safeSpawnDistance] call BRM_FMK_AIS_fnc_checkVisibility) then {
			private _group = [_spawnPosition, _groupType, _side] call BRM_FMK_AIS_fnc_createGroup;

			[_group, _loadout, _groupType, _settings] spawn BRM_FMK_AIS_fnc_initGroup;

			[_group, _attackPosition, _waypointSettings, _eventEndWaypoint] spawn BRM_FMK_AIS_fnc_taskAttack;

			_spawnedGroups append [[_groupType, _group]];
			_spawnCount = _spawnCount + 1;

			sleep 0.01;

			if (!isNil "_eventStart" && (_spawnCount * _groupSize) % _unitTotal == 0) then { // TODO This would result in _eventStart being called at wave end?
				0 spawn _eventStart;
			};

			if (!isNil "_eventEachWave") then {
				0 spawn _eventEachWave;
			};
		};
	} forEach _spawnPositions;

	if (call _endCondition) exitWith {};

	if (!isNil "_eventEnd") then {
		0 spawn _eventEnd;
	};

	sleep _waveDelay;
};

[_id] spawn BRM_FMK_AIS_fnc_deleteSpawner;
