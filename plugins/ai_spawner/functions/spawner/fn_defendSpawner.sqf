#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_defendSpawner

Description:
	Defend spawner logic.

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
	case SPAWNER_CREATED: {};
	case SPAWNER_INIT: {
		private _zone = CONFIG_TARGET;

		if (BRM_FMK_Plugin_AIS_debug) then {
			private _debugMarkers = _spawner get "debugMarkers";

			triggerArea _zone params ["_areaX", "_areaY", "_angle", "_isRectangle"];

			private _color = [CONFIG_SIDE, true] call BIS_fnc_sideColor;
			_debugMarkers pushBack ([true, format ["BRM_FMK_Plugin_AIS_defendSpawner_%1_targetArea_%2", _id, _zone], getPos _zone, ["ELLIPSE", "RECTANGLE"] select _isRectangle, nil, nil, _color, [_areaX, _areaY], nil, _angle, 0.25] call BRM_FMK_fnc_newMarker);
			_debugMarkers pushBack ([true, format ["BRM_FMK_Plugin_AIS_fnc_defendSpawner_%1_target_%2", _id, _zone], _zone call BRM_FMK_fnc_getPos, nil, nil, "mil_dot_noShadow", _color] call BRM_FMK_fnc_newMarker);

			{
				_x params ["_camp"];

				private _position = _camp call BRM_FMK_fnc_getPos;
				_debugMarkers pushBack ([true, format ["BRM_FMK_Plugin_AIS_fnc_defendSpawner_%1_camp_%2", _id, _camp], _position, nil, nil, "mil_start_noShadow", _color] call BRM_FMK_fnc_newMarker);
				_debugMarkers pushBack ([_id, _position, _zone, _color] call BRM_FMK_Plugin_AIS_fnc_createLineMarker);
			} forEach (CONFIG_TYPECONFIG select 0/*_camps*/);
		};

		private _spawnedGroups = _spawner get "groups";
		private _groupCount = 0;
		{
			_x params ["_type", "_count", "_waypointSettings", "_waypointCount"];

			for "_i" from 1 to _count do {
				private _spawnPosition = [_zone] call BRM_FMK_Plugin_AIS_fnc_findPosition;
				if (_spawnPosition isNotEqualTo []) then {
					private _group = [_spawnPosition, _spawnPosition getDir _zone, _type, CONFIG_SIDE, CONFIG_LOADOUT, CONFIG_SETTINGS] call BRM_FMK_Plugin_AIS_fnc_createGroup;
					[_group, _zone, _waypointCount, _waypointSettings] spawn BRM_FMK_Plugin_AIS_fnc_taskPatrol;
					_spawnedGroups pushBack _group;
					_groupCount = _groupCount + 1;
				};
			};
		} forEach CONFIG_GROUPS;
		_spawner set ["groupCount", _groupCount];
		_spawner set ["defendAlarm", false]; // TODO Add config to disable alarm? Add event for when alarm triggered?
	};
	case SPAWNER_TICK: {
		private _spawnedTypes = createHashMap;
		private _spawnedGroups = _spawner get "groups";
		private _target = CONFIG_TARGET;
		{
			if (isNull _x) then {
				_spawnedGroups deleteAt _forEachIndex;
				continue;
			};

			private _units = units _x;
			if (_units findIf { alive _x } != -1) then {
				private _groupType = _x getVariable "BRM_FMK_Plugin_AIS_groupType";
				_spawnedTypes set [_groupType, (_spawnedTypes getOrDefault [_groupType, 0]) + 1];
			} else {
				_spawnedGroups deleteAt _forEachIndex;
				continue;
			};

			if (!(_spawner get "defendAlarm") && { _units findIf { _x call BIS_fnc_enemyDetected } != -1 }) then { // TODO BIS_fnc_enemyDetected radius is 300, add config to change?
				_spawner set ["defendAlarm", true];
				{
					{ deleteWaypoint _x; } forEachReversed waypoints _x;
					// TODO The waypoint count/setting shouldn't be hard coded.
					[_x, _target, 10, "AWARE"] spawn BRM_FMK_Plugin_AIS_fnc_taskPatrol;
				} forEach _spawnedGroups;
			};
		} forEachReversed _spawnedGroups;

		CONFIG_TYPECONFIG params ["_camps"];

		private _campTypes = createHashMap;
		{

			_x params ["_camp", "_groupType", "_count", "_delay", "_safeDistance"];

			if !(_camp getVariable ["BRM_FMK_Plugin_AIS_campDisabled", false]) then {
				if (_count < 1 || { [_camp, _safeDistance] call BRM_FMK_Plugin_AIS_fnc_isPlayerNear }) then {
					_x set [2, 0]; // TODO Don't change count?
					_camp setVariable ["BRM_FMK_Plugin_AIS_campDisabled", true];
					if (BRM_FMK_Plugin_AIS_debug) then {
						format ["BRM_FMK_Plugin_AIS_fnc_defendSpawner_%1_camp_%2", _id, _camp] setMarkerText "Deactivated";
					};
				} else {
					if (time >= _camp getVariable ["BRM_FMK_Plugin_AIS_nextSpawn", 0]) then {
						_campTypes getOrDefault [_groupType, [], true] pushBack _x;
					};
				};
			};
		} forEach _camps;

		private _spawnableTypes = CONFIG_GROUPS select {
			_spawnedTypes getOrDefault [_x select 0, 0] < _x select 1 && {
				_campTypes getOrDefault [_x select 0, []] isNotEqualTo []
			}
		};

		private _spawned = false;
		if (count _spawnableTypes > 0) then {
			_spawned = true;
			//[[camp_1,"Infantry Team",5,5,120]]
			CONFIG_EVENT_WAVE_START call { privateAll; [] call _this; };
			{
				_x params ["_type", "_count", "_waypointSettings", "_waypointCount"];

				private _campConfig = selectRandom (_campTypes getOrDefault [_type, []]);
				_campConfig params ["_camp", "", "_campCount", "_delay", "_inactivePlayerDistance"];

				private _group = [_camp call BRM_FMK_fnc_getPos select [0, 2], 0, _type, CONFIG_SIDE, CONFIG_LOADOUT, CONFIG_SETTINGS] call BRM_FMK_Plugin_AIS_fnc_createGroup;
				[_group, _target, 10, "AWARE"] spawn BRM_FMK_Plugin_AIS_fnc_taskPatrol;
				_spawnedGroups pushBack _group;
				_spawner set ["groupCount", (_spawner get "groupCount") + 1];

				_campConfig set [2, _campCount - 1];

				CONFIG_EVENT_WAVE_SPAWN call { privateAll; [] call _this; };

				if (_delay > 0) then {
					private _campConfigs = _campTypes getOrDefault [_type, []];
					_campConfigs deleteAt (_campConfigs find _campConfig);
				};
				_camp setVariable ["BRM_FMK_Plugin_AIS_nextSpawn", time + _delay];
			} forEach _spawnableTypes;

			CONFIG_EVENT_WAVE_END call { privateAll; [] call _this; };
		};

		if (BRM_FMK_Plugin_AIS_debug) then {
			private _groups = _spawner get "groups";

			private _totalUnits = 0;
			private _activeUnits = 0;
			{
				{
					if (alive _x) then {
						_totalUnits = _totalUnits + 1;
						if !(_x getVariable ["BRM_FMK_Plugin_AIS_cached", false]) then {
							_activeUnits = _activeUnits + 1;
						};
					};
				} forEach units _x;
			} forEach _groups;

			format ["BRM_FMK_Plugin_AIS_fnc_defendSpawner_%1_target_%2", _id, _target] setMarkerText format [
				"%1 (%2,%3/%4)",
				_id,
				count _groups,
				_activeUnits,
				_totalUnits
			];

			{
				_x params ["_camp", "_type", "_spawns"];

				if (_spawns > 0) then {
					private _nextSpawn = _camp getVariable ["BRM_FMK_Plugin_AIS_nextSpawn", 0];
					if (_nextSpawn > 0) then {
						_nextSpawn = (_nextSpawn - time) max 0;
					};
					format ["BRM_FMK_Plugin_AIS_fnc_defendSpawner_%1_camp_%2", _id, _camp] setMarkerText format ["%1 (%2, %3)", _type, _spawns, _nextSpawn];
				};
			} forEach _camps;
		};

		[false, CONFIG_WAVE_DELAY] select _spawned
	};
	case SPAWNER_DELETE: {
		{ deleteVehicle (_x select 0); } forEach (CONFIG_TYPECONFIG select 0);
	};
	case SPAWNER_DEBUGINFO: {
		if !(_spawner getOrDefault ["defendAlarm", false]) then {
			_lines pushBack "Undetected";
		};
	};
};
