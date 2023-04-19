#include "script_component.hpp"
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
_positions params ["_spawnPositions", "_groupStalked"];
_events params ["_eventStart", "_eventEnd", "_eventEachWave", "_eventEndWaypoint"];

_eventStart = if (_eventStart isEqualType "") then { compile _eventStart } else { _eventStart };
_eventEachWave = if (_eventEachWave isEqualType "") then { compile _eventEachWave } else { _eventEachWave };
_eventEnd = if (_eventEnd isEqualType "") then { compile _eventEnd } else { _eventEnd };

_settings = [GVAR(spawnerSettings), _settings] call BIS_fnc_getFromPairs;
_settings params ["_cleanup", "_safeSpawnDistance", "_disableLAMBS", "_aiAggressive", "_caching", "_cachingDistances", "_aiSkill"];

private _spawnedGroups = [];
private _spawnCount = 0;
private _spawnLimit = -1;
private _spawnerType = "STALK";
private _spawnRadius = [0, _spawnPositions] select (_spawnPositions isEqualType 0);
private _groupSize = [_groupType] call FUNC(countGroupType);
private _unitTotal = _groupSize * _groupTotal;

waitUntil _startCondition;

sleep _startDelay;

if (_endCondition isEqualType 0) then {
	_spawnLimit = _endCondition;
	_endCondition = { _spawnLimit != -1 && { _spawnCount > _spawnLimit } };
};

GVAR(Spawners) pushBack [
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
];

while {!call _endCondition} do {
	private _attackPosition = [_groupStalked] call FUNC(toPosition);

	if (!isNil "_eventStart") then {
		0 spawn _eventStart;
	};

	// if it's a group activate stalk mode
	if (_spawnRadius > 0 ) then {
		_spawnPositions = [_attackPosition, _spawnRadius] call FUNC(findPosition);
	};

	{
		if (_spawnLimit != -1 && { _spawnCount > _spawnLimit }) exitWith {};

		waitUntil {
			private _activeUnits = 0;

			_endCondition = [_id] call FUNC(getSpawner) select GVAR(SPAWNER_CONDITIONS) select 1;

			{
				_x params ["_type", "_group"];

				if (_spawnRadius > 0) then {
					// TODO 2D distance?
					if (getPos leader _group distanceSqr getPos leader _groupStalked > GVAR(stalkMaximumDistance) ^ 2) then {
						{deleteVehicle _x} forEach units _group;
					};
				};

				private _unitCount = {alive _x} count units _group;
				if (_unitCount == 0) then {
					_spawnedGroups = _spawnedGroups - [_x];
					_groupTotal = _groupTotal - 1;
				};

				_activeUnits = _activeUnits + _unitCount;
			} forEach _spawnedGroups;

			[
				_id,
				[
					[GVAR(SPAWNER_GROUPS), _spawnedGroups],
					[GVAR(SPAWNER_SPAWN_COUNT), _spawnCount], // Used in fnc_spawnersInfo
					[GVAR(SPAWNER_UNIT_TOTAL), _unitTotal], // TODO Why is this updated, it isn't modified here. (Used in fnc_spawnersInfo)
					[GVAR(SPAWNER_GROUP_TOTAL), _groupTotal] // TODO Not used anywhere, potentially for use in fnc_spawnersInfo
				]
			] call FUNC(updateSpawner);

			sleep 0.05;

			_activeUnits + _groupSize <= _unitTotal || call _endCondition
		};

		if (call _endCondition) exitWith {};

		private _spawnPosition = _x;
		if !([_spawnPosition, _safeSpawnDistance] call FUNC(checkVisibility)) then {
			private _group = [_spawnPosition, _groupType, _side] call FUNC(createGroup);

			[_group, _loadout, _groupType, _settings] spawn FUNC(initGroup);

			[_group, _groupStalked] spawn FUNC(taskStalk);

			_spawnedGroups append [[_groupType, _group]];
			_spawnCount = _spawnCount + 1;

			sleep 0.05;

			if (!isNil "_eventEachWave") then {
				0 spawn _eventEachWave;
			};
		};
	} forEach [_spawnPositions];

	if (call _endCondition) exitWith {};

	if (!isNil "_eventEnd") then {
		0 spawn _eventEnd;
	};

	sleep _waveDelay;
};

[_id] spawn FUNC(deleteSpawner);
