#include "script_component.hpp"
// TODO Merge attack, defense, and stalk spawner code into a single function.
diag_log text format ["%1: %2", _fnc_scriptName, _this];

if (!mission_ai_controller) exitWith {};

params [
	"_id",
	"_side",
	"_zone",
	"_groups",
	"_conditions",
	"_loadout",
	"_camps",
	"_settings"
];

_conditions params ["_startCondition", "_endCondition"];

private _spawnedGroups = [];
private _spawnCount = 0;
private _unitTotal = 0;
private _groupTotal = 0;
private _activeUnits = 0;
private _currentTypeIndex = 0;
private _spawnerType = "DEFENSE";
private _zoneAlarmed = false;
private _knownTargets = [];

waitUntil _startCondition;

_settings = [GVAR(spawnerSettings), _settings] call BIS_fnc_getFromPairs;
_settings params ["_cleanup", "_safeSpawnDistance", "_disableLAMBS", "_aiAggressive", "_caching", "_cachingDistances", "_aiSkill"];

{
	_x params ["_type", "_count", "_waypointSettings", "_waypointCount"];

	private _hasVehicle = [_type] call FUNC(typeHasVehicle);

	for "_i" from 1 to _count do {
		private _spawnPosition = [_zone, 0, [5, 10] select _hasVehicle] call FUNC(findPosition);

		private _group = [_spawnPosition, _type, _side] call FUNC(createGroup);

		[_group, _type, _side, _zone] spawn FUNC(checkBadSpawn);

		_spawnedGroups pushBack [_type, _group];
		_spawnCount = _spawnCount + 1;
		_groupTotal = _groupTotal + 1;

		[_group, _loadout, _type, _settings] spawn FUNC(initGroup);

		[_group, _zone, _waypointCount, _waypointSettings] spawn FUNC(taskPatrol);

		_unitTotal = _unitTotal + count(units _group);

		sleep 0.5;
	};
} forEach _groups;

GVAR(Spawners) append [[
	_id,
	_spawnerType,
	_spawnedGroups,
	_spawnCount,
	-1,
	_unitTotal,
	_groupTotal,
	_side,
	_loadout,
	_cleanup,
	_conditions,
	_camps
]];

if (GVAR(debug)) then {
	[_id, _zone] call  FUNC(createZoneMarker);
	[_id, _camps, _zone] call  FUNC(createCampsMarkers);
};

private _groupCounts = _groups apply { [_x select 0] call FUNC(countGroupType); };

while {count _spawnedGroups > 0 && !call _endCondition} do { // TODO This condition seems problematic
	_activeUnits = 0;

	{
		_x params ["_type", "_group"];

		private _unitCount = {alive _x} count (units _group);
		if (_unitCount == 0) then {
			_spawnedGroups = _spawnedGroups - [_x];
			_groupTotal = _groupTotal - 1;
		};

		if (!_zoneAlarmed) then {
			{
				if (_x call BIS_fnc_enemyDetected) exitWith {
					_zoneAlarmed = true;
					{
						[(_x select 1)] call CBA_fnc_clearWaypoints;
						[(_x select 1), _zone,  10, "AWARE"] spawn FUNC(taskPatrol);
					} forEach _spawnedGroups;
				};
			} forEach units _group;
		};

		_activeUnits = _activeUnits + _unitCount;
	} forEach _spawnedGroups;

	// cycle groups (e.g Regular, Air Heli) and see if they can spawn in
	private _currentGroupType = _groups select _currentTypeIndex select 0;
	_currentTypeIndex = [_currentTypeIndex + 1, 0] select (_currentTypeIndex == count _groups - 1);

	{
		_x params ["_camp", "_type", "_count", "_delay", "_safeDistance"];

		// deactivate if players are near or exhausted
		if (([_camp, _safeDistance] call FUNC(checkNearPlayers) || _count == 0) && !(_camp getVariable [QGVAR(isCampDisabled), false]))  then {
			_x set [2, 0]; // _count
			//_camp setVariable [QGVAR(isDisabled), true];
			if (GVAR(debug)) then {
				format [QGVAR(ico_%1_%2), _id, _camp] setMarkerText "Deactivated";
			};
		// check if units can be spawned
		} else {
			if (_activeUnits + _groupCounts#_currentTypeIndex <= _unitTotal && _type == _currentGroupType && _count > 0) then {
				private _spawnPosition = [_camp] call FUNC(toPosition);
				if !([_spawnPosition, _safeDistance] call FUNC(checkVisibility)) then {
					private _group = [_spawnPosition, _type, _side] call FUNC(createGroup);

					_spawnedGroups append [[_type, _group]];
					_spawnCount = _spawnCount + 1;
					_groupTotal = _groupTotal + 1;
					_activeUnits = _activeUnits + ({alive _x} count (units _group));

					[_group, _loadout, _type, _settings] spawn FUNC(initGroup);

					[_group, _zone, 10, "AWARE"] spawn FUNC(taskPatrol);

					_x set [2, _count - 1]; // _count

					[_group, _delay, _camp] spawn {
						params ["_group", "_delay", "_camp"];
						_group setVariable [QGVAR(groupDeployed), false];

						{
							if (!isObjectHidden _x) then {
								[_x, true] call FUNC(cacheUnit); // TODO Will cause issues if caching is disabled.
							};

							private _vehicle = objectParent _x;
							if (!isNull _vehicle && !isObjectHidden _vehicle) then {
								[_vehicle, {
									_this enableSimulationGlobal false;
									_this hideObjectGlobal true;
								}] remoteExec ["call", 2];
							};
						} forEach units _group;

						sleep _delay; // TODO Should delay spawning directly, instead of relying on caching.

						{
							private _vehicle = objectParent _x;
							if (!isNull _vehicle && isObjectHidden _vehicle) then {
								[_vehicle, {
									_this enableSimulationGlobal true;
									_this hideObjectGlobal false;
								}] remoteExec ["call", 2];
							};
						} forEach units _group;

						if (_camp getVariable [QGVAR(isCampDisabled), false]) exitWith {
							// TODO Should also delete any spawned vehicles?
							{deleteVehicle _x} forEach units _group;
						};

						_group setVariable [QGVAR(groupDeployed), true];
					};
				};
			};
		};
	} forEach (_camps call BIS_fnc_arrayShuffle); // TODO Why are the camps shuffled? So there isn't a preference on which camp gets to spawn.

	[
		_id,
		[
			[GVAR(SPAWNER_GROUPS), _spawnedGroups],
			[GVAR(SPAWNER_SPAWN_COUNT), _spawnCount], // Used in fnc_spawnersInfo
			[GVAR(SPAWNER_UNIT_TOTAL), _unitTotal], // TODO Why is this updated, it isn't modified here. (Used in fnc_spawnersInfo)
			[GVAR(SPAWNER_GROUP_TOTAL), _groupTotal], // TODO Not used anywhere, potentially for use in fnc_spawnersInfo
			[GVAR(SPAWNER_CAMPS), _camps] // TODO Why is this updated, it isn't modified here.
		]
	] call FUNC(updateSpawner);

	if (GVAR(debug)) then {
		[_id, _zone] call  FUNC(updateZoneMarker);
		[_id, _camps, _zone] call  FUNC(updateCampsMarkers);
	};

	sleep 0.05; // TODO Increase? 50 ms delay seems awfully quick. Perhaps a one second delay or more?
};

[_id] call FUNC(deleteSpawner);
