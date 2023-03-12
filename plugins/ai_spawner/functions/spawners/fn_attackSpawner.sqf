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

_conditions params ["_startCondition","_endCondition"];
_positions params ["_spawnPositions","_attackPosition"];
_events params ["_eventStart","_eventEnd","_eventEachWave","_eventEndWaypoint"];

_settings = ([_settings,BRM_FMK_AIS_spawnerSettings] call BRM_FMK_AIS_fnc_getById) select 1;
_settings params ["_cleanup","_safeSpawnDistance","_disableLAMBS","_aiAggressive","_disableCaching","_aiSkill"];

private _spawnedGroups = [];
private _spawnCount = 0;
private _spawnLimit = 9999;
private _spawnerType = if (typeName _attackPosition == "GROUP") then {"STALK"} else {"ATTACK"};
private _spawnRadius = if (_spawnerType == "STALK" && typeName _spawnPositions == "SCALAR") then {_spawnPositions} else {0};
private _groupTypeCount = [_groupType] call BRM_FMK_AIS_fnc_countGroupType;
private _unitTotal = _groupTypeCount * _groupTotal;

waitUntil _startCondition;

sleep _startDelay;

if (typeName _endCondition == "SCALAR") then {
	_spawnLimit = _endCondition;
	_endCondition = { _spawnCount > _spawnLimit };
};

BRM_FMK_AIS_Spawners append [[
	_id,
	_spawnerType,
	_spawnedGroups,
	_spawnCount,
	_spawnLimit,
	_unitTotal,
	_groupTotal,
	_side,
	_loadout,
	_cleanup,
	_conditions
]];

if (BRM_FMK_AIS_debug) then {
	[_id,_positions] spawn BRM_FMK_AIS_fnc_createAttackMarkers;
};

while {!(call _endCondition)} do {

	_spawnPositions = _spawnPositions apply {
		[_x] call BRM_FMK_AIS_fnc_toPosition;
	};

	_attackPosition = [_attackPosition] call BRM_FMK_AIS_fnc_toPosition;

	{
		if (_spawnCount > _spawnLimit) exitWith {};

		waitUntil {
			private _activeUnits = 0;

			_endCondition = (([_id] call BRM_FMK_AIS_fnc_getSpawner) select BRM_FMK_AIS_SPAWNER_CONDITIONS) select 1;

			if (typeName _endCondition == "SCALAR") then {
				_spawnLimit = _endCondition;
				_endCondition = { _spawnCount > _spawnLimit };
			};

			{
				_x params ["_type","_group"];

				if ({alive _x} count (units _group) == 0) then {
					_spawnedGroups = _spawnedGroups - [_x];
					_groupTotal = _groupTotal - 1;
				};

				_activeUnits = _activeUnits + ({alive _x} count (units _group));

			} forEach _spawnedGroups;

			[
				_id,
				[
					[BRM_FMK_AIS_SPAWNER_GROUPS,_spawnedGroups],
					[BRM_FMK_AIS_SPAWNER_SPAWN_COUNT,_spawnCount],
					[BRM_FMK_AIS_SPAWNER_UNIT_TOTAL,_unitTotal],
					[BRM_FMK_AIS_SPAWNER_GROUP_TOTAL,_groupTotal]
				]
			] call BRM_FMK_AIS_fnc_updateSpawner;

			sleep 0.05;

			(((_activeUnits + _groupTypeCount) <= _unitTotal) || (call _endCondition))
		};

		if (call _endCondition) exitWith {};

		private _spawnPosition = _x;

		if (!([_spawnPosition,_safeSpawnDistance] call BRM_FMK_AIS_fnc_checkVisibility)) then {

			private _group = [_spawnPosition,_groupType,_side] call BRM_FMK_AIS_fnc_createGroup;

			[_group,_loadout,_groupType,_settings] spawn BRM_FMK_AIS_fnc_initGroup;

			[_group,_attackPosition,_waypointSettings,_eventEndWaypoint] spawn BRM_FMK_AIS_fnc_taskAttack;

			_spawnedGroups append [[_groupType,_group]];
			_spawnCount = _spawnCount + 1;

			sleep 0.05;

			if (!isNil "_eventStart" && ((_spawnCount*_groupTypeCount) mod _unitTotal == 0)) then {
				0 spawn compile _eventStart;
			};

			if (!isNil "_eventEachWave") then {
				0 spawn compile _eventEachWave;
			};
		};

	} forEach _spawnPositions;

	if (call _endCondition) exitWith {};

	if (!isNil "_eventEnd") then {
		0 spawn compile _eventEnd;
	};

	sleep _waveDelay;

};

[_id] spawn BRM_FMK_AIS_fnc_deleteSpawner;
