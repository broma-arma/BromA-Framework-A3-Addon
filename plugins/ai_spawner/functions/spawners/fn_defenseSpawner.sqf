// TODO Merge attack, defense, and stalk spawner code into a single function.
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

_settings = [BRM_FMK_AIS_spawnerSettings, _settings] call BIS_fnc_getFromPairs;
_settings params ["_cleanup", "_safeSpawnDistance", "_disableLAMBS", "_aiAggressive", "_disableCaching", "_aiSkill"];

{
	_x params ["_type", "_count", "_waypointSettings", "_waypointCount"];

	private _hasVehicle = [_type] call BRM_FMK_AIS_fnc_typeHasVehicle;

	for "_i" from 1 to _count do {
		private _spawnPosition = [_zone, 0, _zone, [5, 10] select _hasVehicle] call BRM_FMK_AIS_fnc_findPosition;

		private _group = [_spawnPosition, _type, _side] call BRM_FMK_AIS_fnc_createGroup;

		[_group, _type, _side, _zone] spawn BRM_FMK_AIS_fnc_checkBadSpawn;

		_spawnedGroups pushBack [_type, _group];
		_spawnCount = _spawnCount + 1;
		_groupTotal = _groupTotal + 1;

		[_group, _loadout, _type, _settings] spawn BRM_FMK_AIS_fnc_initGroup;

		[_group, _zone, _waypointCount, _waypointSettings] spawn BRM_FMK_AIS_fnc_taskPatrol;

		_unitTotal = _unitTotal + count(units _group);

		sleep 0.5;
	};
} forEach _groups;

BRM_FMK_AIS_Spawners append [[
	_id,
	_spawnerType,
	_spawnedGroups,
	_spawnCount,
	9999,
	_unitTotal,
	_groupTotal,
	_side,
	_loadout,
	_cleanup,
	_conditions,
	_camps
]];

if (BRM_FMK_AIS_debug) then {
	[_id, _zone] call  BRM_FMK_AIS_fnc_createZoneMarker;
	[_id, _camps, _zone] call  BRM_FMK_AIS_fnc_createCampsMarkers;
};

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
						[(_x select 1), _zone,  10, "AWARE"] spawn BRM_FMK_AIS_fnc_taskPatrol;
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
		if (([_camp, _safeDistance] call BRM_FMK_AIS_fnc_checkNearPlayers || _count == 0) && !(_camp getVariable ["BRM_FMK_AIS_isCampDisabled", false]))  then {
			_x set [2, 0]; // _count
			_camp setVariable ["BRM_FMK_AIS_isDisabled", true];
			if (BRM_FMK_AIS_debug) then {
				format ["BRM_FMK_AIS_ico_%1_%2", _id, _camp] setMarkerText "Deactivated";
			};
		// check if units can be spawned
		} else if (_activeUnits + ([_currentGroupType] call BRM_FMK_AIS_fnc_countGroupType) <= _unitTotal && _type == _currentGroupType && _count > 0) then {
			private _spawnPosition = [_camp] call BRM_FMK_AIS_fnc_toPosition;
			if !([_spawnPosition, _safeDistance] call BRM_FMK_AIS_fnc_checkVisibility) then {
				private _group = [_spawnPosition, _type, _side] call BRM_FMK_AIS_fnc_createGroup;

				_spawnedGroups append [[_type, _group]];
				_spawnCount = _spawnCount + 1;
				_groupTotal = _groupTotal + 1;
				_activeUnits = _activeUnits + ({alive _x} count (units _group));

				[_group, _loadout, _type, _settings] spawn BRM_FMK_AIS_fnc_initGroup;

				[_group, _zone, 10, "AWARE"] spawn BRM_FMK_AIS_fnc_taskPatrol;

				_x set [2, _count - 1]; // _count

				[_group, _delay, _camp] spawn {
					params ["_group", "_delay", "_camp"];
					_group setVariable ["BRM_FMK_AIS_groupDeployed", false];

					{
						if (!isObjectHidden _x) then {
							[_x, true] call BRM_FMK_AIS_fnc_cacheUnit; // TODO Will cause issues if caching is disabled.
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

					if (_camp getVariable ["BRM_FMK_AIS_isCampDisabled", false]) exitWith {
						// TODO Should also delete any spawned vehicles
						{deleteVehicle _x} forEach units _group;
					};

					_group setVariable ["BRM_FMK_AIS_groupDeployed", true];
				};
			};
		};
	} forEach (_camps call BIS_fnc_arrayShuffle);

	[
		_id,
		[
			[BRM_FMK_AIS_SPAWNER_GROUPS, _spawnedGroups],
			[BRM_FMK_AIS_SPAWNER_SPAWN_COUNT, _spawnCount], // TODO This value isn't used anywhere, perhaps for debugging or future use?
			[BRM_FMK_AIS_SPAWNER_UNIT_TOTAL, _unitTotal], // TODO This value isn't used anywhere, perhaps for debugging or future use? Why is this updated, it isn't modified here.
			[BRM_FMK_AIS_SPAWNER_GROUP_TOTAL, _groupTotal], // TODO This value isn't used anywhere, perhaps for debugging or future use?
			[BRM_FMK_AIS_SPAWNER_CAMPS, _camps] // TODO Why is this updated, it isn't modified here.
		]
	] call BRM_FMK_AIS_fnc_updateSpawner;

	if (BRM_FMK_AIS_debug) then {
		[_id, _zone] call  BRM_FMK_AIS_fnc_updateZoneMarker;
		[_id, _camps, _zone] call  BRM_FMK_AIS_fnc_updateCampsMarkers;
	};

	sleep 0.05; // TODO Increase? 50 ms delay seems awfully quick. Perhaps a one second delay or more?
};

[_id] call BRM_FMK_AIS_fnc_deleteSpawner;
