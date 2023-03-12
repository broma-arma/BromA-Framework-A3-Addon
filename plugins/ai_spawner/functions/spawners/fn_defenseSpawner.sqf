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

_conditions params ["_startCondition","_endCondition"];

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

_settings = ([_settings,BRM_FMK_AIS_spawnerSettings] call BRM_FMK_AIS_fnc_getById) select 1;
_settings params ["_cleanup","_safeSpawnDistance","_disableLAMBS","_aiAggressive","_disableCaching","_aiSkill"];

{
	_x params ["_type","_count","_waypointSettings","_waypointCount"];

	private _hasVehicle = [_type] call BRM_FMK_AIS_fnc_typeHasVehicle;

	for "_i" from 1 to _count do {
		private _spawnPosition = if (!(_hasVehicle)) then {
			[_zone,0,_zone,5] call BRM_FMK_AIS_fnc_findPosition;
		} else {
			[_zone,0,_zone,10] call BRM_FMK_AIS_fnc_findPosition;
		};

		private _group = [_spawnPosition,_type,_side] call BRM_FMK_AIS_fnc_createGroup;

		[_group,_type,_side,_zone] spawn BRM_FMK_AIS_fnc_checkBadSpawn;

		_spawnedGroups append [[_type,_group]];
		_spawnCount = _spawnCount + 1;
		_groupTotal = _groupTotal + 1;

		[_group,_loadout,_type,_settings] spawn BRM_FMK_AIS_fnc_initGroup;

		[_group,_zone,_waypointCount,_waypointSettings] spawn BRM_FMK_AIS_fnc_taskPatrol;

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
	[_id,_zone] call  BRM_FMK_AIS_fnc_createZoneMarker;
	[_id,_camps,_zone] call  BRM_FMK_AIS_fnc_createCampsMarkers;
};

while {(count _spawnedGroups) > 0 && !(call _endCondition)} do {

	_activeUnits = 0;

	{
		_x params ["_type","_group"];

		if ({alive _x} count (units _group) == 0) then {
			_spawnedGroups = _spawnedGroups - [_x];
			_groupTotal = _groupTotal - 1;
		};

		if (!_zoneAlarmed) then {
			{
				if (_x call BIS_fnc_enemyDetected) exitWith {
					_zoneAlarmed = true;
					{
						[(_x select 1)] call CBA_fnc_clearWaypoints;
						[(_x select 1),_zone, 10,"AWARE"] spawn BRM_FMK_AIS_fnc_taskPatrol;
					} forEach _spawnedGroups;
				};
			} forEach units _group;
		};

		_activeUnits = _activeUnits + ({alive _x} count (units _group));
	} forEach _spawnedGroups;

	// cycle groups (e.g Regular, Air Heli) and see if they can spawn in
	private _currentGroupType = (_groups select _currentTypeIndex) select 0;

	{
		_x params ["_camp","_type","_count","_delay","_safeDistance"];

		private _campIndex = _camps find _x;

		// check if players are near spawn point or it's without spawninings and deactivate it
		if (([_camp,_safeDistance] call BRM_FMK_AIS_fnc_checkNearPlayers || _count == 0) && !(_camp getVariable ["BRM_FMK_AIS_isCampDisabled",false]))  then {
			_camps set [_campIndex,[_camp,_type,0,_delay,_safeDistance]];
			_camp setVariable ["BRM_FMK_AIS_isDisabled",true];
			if (BRM_FMK_AIS_debug) then {
				format ["BRM_FMK_AIS_ico_%1_%2",_id,_camp] setMarkerText "Deactivated";
			};
		} else {
			// check if units can be spawned
			if (((_activeUnits + ([_currentGroupType] call BRM_FMK_AIS_fnc_countGroupType)) <= _unitTotal)) then {

				if (_type == _currentGroupType && _count > 0) then {

					private _spawnPosition = [_camp] call BRM_FMK_AIS_fnc_toPosition;

					if (!([_spawnPosition,_safeDistance] call BRM_FMK_AIS_fnc_checkVisibility)) then {

						private _group = [_spawnPosition,_type,_side] call BRM_FMK_AIS_fnc_createGroup;

						_spawnedGroups append [[_type,_group]];
						_spawnCount = _spawnCount + 1;
						_groupTotal = _groupTotal + 1;
						_activeUnits = _activeUnits + ({alive _x} count (units _group));

						[_group,_loadout,_type,_settings] spawn BRM_FMK_AIS_fnc_initGroup;

						[_group,_zone,10,"AWARE"] spawn BRM_FMK_AIS_fnc_taskPatrol;

						_camps set [_campIndex,[_camp,_type,(_count - 1),_delay,_safeDistance]];

						[_group,_delay,_camp] spawn {
							params ["_group","_delay","_camp"];
							_group setVariable ["BRM_FMK_AIS_groupDeployed",false];

							{
								if (!isObjectHidden _x) then {
									[_x,true] call BRM_FMK_AIS_fnc_cacheUnit;
								};

								if (vehicle _x != _x && !isObjectHidden(vehicle _x)) then {
									[vehicle _x,false] remoteExec ["enableSimulationGlobal",2];
									[vehicle _x,true] remoteExec ["hideObjectGlobal",2];
								};
							} forEach units _group;

							sleep _delay;

							{
								if (vehicle _x != _x && isObjectHidden(vehicle _x)) then {
									[vehicle _x,true] remoteExec ["enableSimulationGlobal",2];
									[vehicle _x,false] remoteExec ["hideObjectGlobal",2];
								};
							} forEach units _group;

							if (_camp getVariable ["BRM_FMK_AIS_isCampDisabled",false]) exitWith {
								{deleteVehicle _x} forEach units _group;
							};

							_group setVariable ["BRM_FMK_AIS_groupDeployed",true];
						};
					};
				};
			};
		};
	} forEach (_camps call BIS_fnc_arrayShuffle);

	_currentTypeIndex = if (_currentTypeIndex == ((count _groups) - 1)) then {0} else {_currentTypeIndex + 1};

	[
		_id,
		[
			[BRM_FMK_AIS_SPAWNER_GROUPS,_spawnedGroups],
			[BRM_FMK_AIS_SPAWNER_SPAWN_COUNT,_spawnCount],
			[BRM_FMK_AIS_SPAWNER_UNIT_TOTAL,_unitTotal],
			[BRM_FMK_AIS_SPAWNER_GROUP_TOTAL,_groupTotal],
			[BRM_FMK_AIS_SPAWNER_CAMPS,_camps]
		]
	] call BRM_FMK_AIS_fnc_updateSpawner;

	if (BRM_FMK_AIS_debug) then {
		[_id,_zone] call  BRM_FMK_AIS_fnc_updateZoneMarker;
		[_id,_camps,_zone] call  BRM_FMK_AIS_fnc_updateCampsMarkers;
	};

	sleep 0.05;

};

[_id] call BRM_FMK_AIS_fnc_deleteSpawner;
