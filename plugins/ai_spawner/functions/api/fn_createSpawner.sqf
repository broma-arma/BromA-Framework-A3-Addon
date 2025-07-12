#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_AIS_fnc_createSpawner

Description:
	Create a spawner.

Parameters:
	_type - Type of spawner to create: "defend", "attack", "stalk" [STRING]
	_id - Unique ID [STRING]
	_side - Side [SIDE]
	_faction - Faction [STRING]
	_settings - Spawner Settings ID [STRING]
	_target - Target [OBJECT/GROUP/MARKER/LOCATION/POSITION/WAYPOINT/ARRAY]
	_waveDelay - Delay, in seconds, between waves [NUMBER]
	_groups - Group configs [ARRAY]
		_group - Group config [ARRAY]
			_type - Type ID [STRING, defaults to "DEFAULT"]
			_count - Count [NUMBER, defaults to 0]
			_waypointSettings - Waypoint Settings ID [STRING, defaults to "DEFAULT"]
			_waypointCount - Waypoint count [NUMBER, defaults to 2]
	_typeConfig - Type specific config [ARRAY, defaults to []]
		defend:
			_camps - Camp configs [ARRAY, defaults to []]
				_campConfig - Camp config [ARRAY]
					_camp - position [TRIGGER]
					_groupType - group type [STRING]
					_count - spawn count [NUMBER, defaults to 2]
					_delay - spawn delay [NUMBER, defaults to 5]
					_safeDistance - distance to inactivate if players near [NUMBER, defaults to 200]
		attack:
			_spawnPositions - Spawn positions [ARRAY, defaults to []]
				_spawnPosition - Spawn position [OBJECT/GROUP/MARKER/LOCATION/POSITION/WAYPOINT/ARRAY]
		stalk:
			_maxDistance - maximum distance where stalking group will be deleted if no player are around [NUMBER, defaults to _settingSafeSpawnDistance * 2]
	_conditions - Conditions [ARRAY, defaults to []]
		_startCondition - Start condition [CODE/NUMBER/ARRAY, defaults to { true }]
			CODE - Condition for spawner to start
			NUMBER - Delay, in seconds, before spawner is started
			ARRAY:
				_startCondition - Condition for spawner to start [CODE, defaults to { true }]
				_startDelay - Delay, in seconds, after condition returns true and before spawner is started [NUMBER, defaults to 0]
		_endCondition - Condition for spawner to end [CODE/NUMBER/ARRAY, defaults to { false }]
			CODE - Condition for spawner to end
			NUMBER - Group spawn limit
			ARRAY:
				_endCondition - Condition for spawner to end [CODE, defaults to { false }]
				_spawnLimit - Group spawn limit [NUMBER, defaults to -1]
	_events - Events [ARRAY, defaults to []]
		_eventWaveStart - Before a wave is spawned [CODE, defaults to {}]
		_eventWaveEnd - After a wave is spawned [CODE, defaults to {}]
		_eventWaveSpawn - After a group is spawned [CODE, defaults to {}]
		_eventEndWaypoint - After a group reaches a waypoint [CODE, defaults to {}]

Returns:
	Spawn position, or empty array if failed [ARRAY]

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

try {
	params [
		["_type", "", [""]],
		["_id", "", [""]],
		["_side", sideUnknown, [sideUnknown]],
		["_faction", "", [""]],
		["_settings", "", [""]],
		["_target", objNull, [objNull, grpNull, "", locationNull, []]],
		["_waveDelay", 5, [0]],
		["_groups", [], [[]]],
		["_typeConfig", [], [[]]],
		["_conditions", [], [[]], [0, 1, 2]],
		["_events", [], [[]], [0, 1, 2, 3, 4]]
	];

	_id = trim _id;

	if !(_type in ["attack", "stalk", "defend"]) then { throw ["Invalid spawner type, expected ""attack"", ""stalk"", or ""defend"", got %1", _type]; };
	if (!isNil { GET_SPAWNER(_id) }) then { throw ["Invalid spawner id, id already exists: %1", _id]; };
	if (_id == "") then { throw ["Invalid spawner id, id cannot be empty"]; };
	if !(_side in [BLUFOR, OPFOR, INDEPENDENT, CIVILIAN]) then { throw ["Invalid side in ""%1"" spawner, expected BLUFOR, OPFOR, INDEPENDENT, or CIVILIAN, got %2", _id, _side]; };
	if (_faction == "") then { throw ["Invalid faction in ""%1"" spawner, id cannot be empty", _id]; };

	_settings = _settings call BRM_FMK_Plugin_AIS_fnc_getSpawnerSettings;
	if (isNil "_settings") then { throw ["Invalid settings in ""%1"" spawner, doesn't exist: %2", _id, _settings]; };
	_settings params [
		["_settingCleanup", 100, [0]],
		["_settingSafeSpawnDistance", 150, [0]],
		["_settingDisableLAMBS", false, [false]],
		["_settingAIAggressive", false, [false]],
		["_settingCachingDistances", [650, 1000], [false, []], [2]],
		["_settingAISkill", "DEFAULT"]
	];
	if (_settingSafeSpawnDistance < 50) then { throw ["Invalid safeSpawnDistance in ""%1"" spawner, less than 50: %2", _id, _settingSafeSpawnDistance]; };
	if (_settingCachingDistances isEqualTo true) then { throw ["Invalid cacheDistance in ""%1"" spawner, cannot be set to true: %2", _id, _settingCachingDistances]; };
	if (_settingCachingDistances isEqualType []) then {
		if (_settingCachingDistances#0 < 0) then { throw ["Invalid infantryCacheDistance in ""%1"" spawner, less than 0: %2", _id, _settingCachingDistances#0]; };
		if (_settingCachingDistances#1 < 0) then { throw ["Invalid vehicleCacheDistance in ""%1"" spawner, less than 0: %2", _id, _settingCachingDistances#1]; };
		if (_settingCachingDistances isEqualTo [0, 0]) then { throw ["Invalid cacheDistance in ""%1"" spawner, use false: %2", _id, _settingCachingDistances]; };
	};
	if (isNil { _settingAISkill call BRM_FMK_Plugin_AIS_fnc_getSkillSettings }) then { throw ["Invalid AI skill in ""%1"" spawner, doesn't exist: %2", _id, _settingAISkill]; };

	if (_target isEqualTypeAny [objNull, grpNull, locationNull] && { isNull _target }) then { throw ["Invalid target in ""%1"" spawner, target cannot be null", _id]; };
	if (_target isEqualType "" && { markerShape _target == "" }) then { throw ["Invalid target in ""%1"" spawner, target doesn't exist", _id]; };
	if (_waveDelay < 1) then { throw ["Invalid waveDelay in ""%1"" spawner, less than 1: %2", _id, _waveDelay]; };
	if (_groups isEqualTo []) then { throw ["Invalid groups in ""%1"" spawner, no groups defined", _id]; };

	{
		_x params [
			["_type", "DEFAULT", [""]],
			["_count", 0, [0]],
			["_waypointSettings", "DEFAULT", [""]],
			["_waypointCount", 2, [0]]
		];

		if (isNil { _type call BRM_FMK_Plugin_AIS_fnc_getGroupSettings }) then { throw ["Invalid group type in ""%1"" spawner, doesn't exist: %2", _id, _type]; };
		if (_count < 0) then { throw ["Invalid group count in ""%1"" spawner, less than 0: %2", _id, _count]; };
		if (isNil { _waypointSettings call BRM_FMK_Plugin_AIS_fnc_getWaypointSettings }) then { throw ["Invalid group waypoint settings in ""%1"" spawner, doesn't exist: %2", _id, _waypointSettings]; };
		if (_waypointCount < 2) then { throw ["Invalid group waypoint count in ""%1"" spawner, less than 2: %2", _id, _count]; };
	} forEach _groups;

	switch (_type) do {
		case "attack": {
			_typeConfig params [
				["_spawnPositions", [], [[]]]
			];

			{
				if !(_x isEqualTypeAny [objNull, grpNull, "", locationNull, []]) then { throw ["Invalid spawn position in ""%1"" spawner, index %2, expected OBJECT/GROUP/STRING/LOCATION/ARRAY, got %3 (%4)", _id, _forEachIndex, if (isNil "_x") then { "NIL" } else { typeName _x }, _x]; };
				if (_x isEqualTypeAny [objNull, grpNull, locationNull] && { isNull _x }) then { throw ["Invalid spawn position in ""%1"" spawner, index %2, %3 is null", _id, _forEachIndex, typeName _x]; };
				if (markerShape _x == "") then { throw ["Invalid spawn position in ""%1"" spawner, index %2, marker doesn't exist: %3", _id, _forEachIndex, _x]; };
			} forEach _spawnPositions;
		};
		case "stalk": {
			_typeConfig params [
				["_maxDistance", _settingSafeSpawnDistance * 2, [0]]
			];

			if (_maxDistance < _settingSafeSpawnDistance) then { throw ["Invalid maxDistance in ""%1"" spawner, less than spawnRadius: %2 (%3)", _id, _maxDistance, _settingSafeSpawnDistance]; };
		};
		case "defend": {
			_typeConfig params [["_camps", [], [[]]]];
			{
				_x params [
					["_camp", objNull, [objNull]],
					["_groupType", "DEFAULT", [""]], // TODO Addon defined types
					["_count", 2, [0]],
					["_delay", 5, [0]],
					["_safeDistance", 200, [0]]
				];

				if (isNull _camp) then { throw ["Invalid camp object in ""%1"" spawner, index %2, null object: %3", _id, _forEachIndex, _camp]; };
				//if !(_camp isKindOf "EmptyDetector") then { throw ["Invalid camp object type in ""%1"" spawner, index %2, camp not a trigger object: %2", _id, _forEachIndex, typeOf _camp]; };
				if (isNil { _groupType call BRM_FMK_Plugin_AIS_fnc_getGroupSettings }) then { throw ["Invalid camp group type in ""%1"" spawner, index %2, doesn't exist: %2", _id, _forEachIndex, _groupType]; };
				if (_count < 1) then { throw ["Invalid camp count in ""%1"" spawner, index %2, less than 1: %3", _id, _forEachIndex, _count]; };
				if (_delay < 1) then { throw ["Invalid camp delay in ""%1"" spawner, index %2, less than 1: %3", _id, _forEachIndex, _delay]; };
				if (_safeDistance < 0) then { throw ["Invalid camp safeDistance in ""%1"" spawner, index %2, less than 0: %3", _id, _forEachIndex, _safeDistance]; };
			} forEach _camps;
		};
	};

	_conditions params [
		["_startCondition", { true }, [{}, 0, []]],
		["_endCondition", { false }, [{}, 0, []]]
	];

	if (_startCondition isEqualType []) then {
		private _startDelay = _startCondition param [1, 0, [0]];
		_startCondition = _startCondition param [0, { true }, [{}]];

		if (_startDelay > 0) then {
			_startCondition = compile (toString {
				if ("startDelayTime" in _y) then {
					private _done = time - (_y get "startDelayTime") >= _startDelay;
					if (_done) then {
						_y deleteAt "startDelayTime";
					};
					_done
				} else {
					if (call { _startCondition }) then {
						_y set ["startDelayTime", time];
					};
					false
				}
			} regexReplace ["_startDelay", str _startDelay] regexReplace ["_startCondition", toString _startCondition]);
		};
	};
	if (_startCondition isEqualType 0) then {
		_startCondition = compile (toString {
			if ("startDelayTime" in _y) then {
				private _done = time - (_y get "startDelayTime") >= _startDelay;
				if (_done) then {
					_y deleteAt "startDelayTime";
				};
				_done
			} else {
				_y set ["startDelayTime", time];
				false
			}
		} regexReplace ["_startDelay", str _startCondition]);
	};

	if (_endCondition isEqualType []) then {
		private _spawnLimit = _endCondition param [1, -1, [0]];
		_endCondition = _endCondition param [0, { false }, [{}]];

		if (_spawnLimit > -1) then {
			_endCondition = compile format ["_y get ""groupCount"" >= %1 || { %2 }", _spawnLimit, toString _endCondition];
		};
	};
	if (_endCondition isEqualType 0) then {
		_endCondition = compile format ["_y get ""groupCount"" >= %1", _endCondition];
	};

	_events params [
		["_eventWaveStart", {}, [{}]],
		["_eventWaveEnd", {}, [{}]],
		["_eventWaveSpawn", {}, [{}]],
		["_eventEndWaypoint", {}, [{}]]
	];

	BRM_FMK_Plugin_AIS_spawners set [_id, createHashMapFromArray [
		["config", [ // Config
			_type,
			_id,
			_side,
			_faction,
			_settings,
			_target,
			_waveDelay,
			_groups,
			_typeConfig,
			_startCondition, _endCondition,
			_eventWaveStart, _eventWaveEnd, _eventWaveSpawn, _eventEndWaypoint
		]],
		["state", 0],
		["groupCount", 0], // Number of groups that the spawner has created
		["groups", []], // Active groups [GROUP, GROUP, ...]
		["pause", false],
		["debugMarkers", []]
		//["spawnLimit", -1] // Number of groups that the spawner can create
	]];
} catch {
	_exception call BRM_FMK_fnc_error;
};
