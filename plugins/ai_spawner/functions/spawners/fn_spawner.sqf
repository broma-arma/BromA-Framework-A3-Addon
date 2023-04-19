#include "script_component.hpp"
diag_log text format ["%1: %2", _fnc_scriptName, _this];

if (!mission_ai_controller) exitWith {};

// TODO Move type specific code into separate functions

/*
[
	"attack",                               // type
	"Attack Spawner",                       // id
	east,                                   // side

	"CSAT",                                 // loadout

	"DEFAULT",                              // spawner settings

	target,                                 // ATTACK: attack position, DEFENSE: trigger, STALK: group to be stalked

	[                                       // Groups
		[
			"Infantry Team",                // Group Type
			2,                              // count
			"SAFE",                         // Waypoint Settings
			10                              // Waypoint Count (ATTACK/STALK)
		],
		["Cars",2,"SAFE",5]
	],

	[ // spawner type config
		[                                   // spawn position(s) (ATTACK) or spawn radius around the group (STALK)
			"aiSpawner_attack_spawn_1",
			"aiSpawner_attack_spawn_2"
		] || 1000,
		0,                                  // delay before start (ATTACK/STALK)
		5,                                  // delay each wave (ATTACK/STALK)

		// camps (DEFENSE)
		[
			aiSpawner_defense_camp_1,   // position
			"Infantry Team",            // group type
			5,                          // spawn count
			5,                          // spawn delay
			200                         // distance to inactivate if players near
		]

	],

	[
		{(true)},                           // start condition
		{(false)}                           // end condition
	],

	[
		"",                             // start event (ATTACK/STALK)
		"",                             // end event (ATTACK/STALK)
		"",                             // each wave event (ATTACK/STALK)
		""                              // waypoint on complete event (ATTACK/STALK)
	]
]
*/

params [
	"_type",
	"_id",
	"_side",
	"_loadout",
	"_settings",
	"_target",
	"_groups",
	"_typeConfig",
	"_conditions",
	"_events"
];

_type = toUpper _type;

_conditions params ["_conditionStart", "_conditionEnd"];

private _spawnLimit = -1;
if (_conditionEnd isEqualType 0) then {
	_spawnLimit = _conditionEnd;
	_conditionEnd = { _spawnLimit != -1 && { _spawnCount > _spawnLimit } };
};

{ // Compile events
	if (_x isEqualType "") then { _events set [_forEachIndex, compile _x]; };
} forEach (_events select [0, 3]);
if (_events select 3 isEqualType {}) then { // Stringify WP complete
	private _str = str (_events select 3);
	_events set [3, _str select [1, count _str - 2]]; // TODO Test
};

_events params ["_eventStart", "_eventEnd", "_eventEachWave", "_eventWaypointComplete"];

if (_settings isEqualType "") then {
	_settings = GVAR(spawnerSettings) get _settings;
};
_settings params ["_cleanup", "_safeSpawnDistance", "_disableLAMBS", "_aiAggressive", "_caching", "_cachingDistances", "_aiSkill"];

if (_aiSkill isEqualType "") then {
	_aiSkill = GVAR(aiSkills) get _aiSkill;
	_settings set [6, _aiSkill];
};

private _camps = [];
private _startDelay = 0;
private _waveDelay = 30;

if (_type == "ATTACK" && { _target isEqualType grpNull }) then {
	_type = "STALK";
};
switch (_type) do {
	case "STALK";
	case "ATTACK": {
		if (_typeConfig select 0 isEqualType 0) then {
			_camps = [[[_target, _typeConfig select 0], "", -1, 0, -1]];
		} else {
			{
				if (_x isEqualType "") then {
					_camps pushBack [[_x] call FUNC(toPosition), "", -1, 0, -1];
				};
			} forEach (_typeConfig select 0);
		};
		_startDelay = _typeConfig select 1;
		_waveDelay = _typeConfig select 2 max 0.1;

		if (_type == "ATTACK") then {
			_target = [_target] call FUNC(toPosition);
		};
	};
	case "DEFENSE": {
		_camps = _typeConfig;
	};
	default { };
};

private _groupCounts = [];
private _unitTotal = 0;
{
	_x params ["_type", "_count", "_waypointSettings", ["_waypointCount", 0]];
	_waypointSettings = _waypointSettings;

	if (_type isEqualType "") then {
		_type = GVAR(groupTypes) get _type;
		_x set [0, _type];
	};

	private _size = [_type] call FUNC(countGroupType);
	_groupCounts pushBack _size;
	private _total = _size * _count;
	if (_total > _unitTotal) then {
		_unitTotal = _total;
	};
} forEach _groups;

waitUntil _conditionStart;

sleep _startDelay;

private _spawnedGroups = [];
private _spawnCount = 0;

private _spawner = call CBA_fnc_createNamespace;

{
	_spawner setVariable _x;
} forEach [
	["id", _id],
	["type", _type], // "ATTACK", "STALK", "DEFENSE"
	["groups", _spawnedGroups], // Currently spawned groups
	["spawned", _spawnCount], // Total number of groups spawned
	["spawnLimit", _spawnLimit], // Max number of groups that can be spawned (-1 for no limit)
	["maxUnits", _unitTotal], // Max number of units that can be active
	["side", _side], // Side
	["loadout", _loadout] // Loadout
];

GVAR(spawners) set [_id, _spawner];

switch (_type) do {
	case "ATTACK": {
		if (GVAR(debug)) then {
			[_id, [_camps apply { _x select 0 }, _target]] spawn FUNC(createAttackMarkers);
		};
	};
	case "STALK": {
	};
	case "DEFENSE": {
		{
			_x params ["_type", "_count", "_waypointSettings", ["_waypointCount", 10]];

			private _hasVehicle = [_type] call FUNC(typeHasVehicle);
			for "_i" from 1 to _count do {
				if (_i > 1) then { sleep 0.5; };

				private _group = [_target, _type, _side] call FUNC(createGroup);

				_spawnedGroups pushBack _group;
				_spawnCount = _spawnCount + 1;
				_spawner setVariable ["spawned", _spawnCount];

				[_group, _loadout, _type, _settings] spawn FUNC(initGroup);

				[_group, _target, _waypointCount, _waypointSettings] spawn FUNC(taskPatrol);
			};
		} forEach _groups;
	};
	default { };
};

private _groupIndex = 0;
private _attackCampIndex = 0;
private _attackWaveStarted = false;
while {_id in GVAR(spawners) && { !call _conditionEnd }} do {
	if (_spawnLimit != -1 && { _spawnCount > _spawnLimit }) exitWith {};

	private _activeUnits = 0;
	for "_i" from count _spawnedGroups - 1 to 0 step -1 do {
		private _unitCount = { alive _x } count units (_spawnedGroups select _i);
		if (_unitCount == 0) then {
			_spawnedGroups deleteAt _i;
		};
		_activeUnits = _activeUnits + _unitCount;
	};

	_groups#_groupIndex params ["_groupType", "_groupCount", "_groupWaypointSettings", "_groupWaypointCount"];

	if (_activeUnits + _groupCount <= _unitTotal) then {
		if (_type == "DEFENSE") then {
			private _availableCamps = _camps select {
				_x params ["_camp", "_type", "_count", "_delay", "_safeDistance"];
				!([_camp, _safeSpawnDistance] call FUNC(checkVisibility)) // TODO This is problematic, perhaps only check distance?
				&& (_type == "" || _type == _groupType select 0)
			};
			private _camp = selectRandom _availableCamps;
			if (!isNil "_camp") then {
				if (!isNil "_eventStart") then {
					call _eventStart;
				};

				_camp params ["_campPos", "_campType", "_campCount", "_campDelay", "_campSafeDistance"];

				private _group = [_campPos, _groupType, _side] call FUNC(createGroup);
				[_group, _loadout, _groupType, _settings] spawn FUNC(initGroup);
				[_group, _target, _groupWaypointSettings, _eventWaypointComplete] spawn FUNC(taskAttack);

				_spawnedGroups pushBack _group;
				_spawnCount = _spawnCount + 1;
				_spawner setVariable ["spawned", _spawnCount];

				if (!isNil "_eventEachWave") then {
					call _eventEachWave;
				};

				if (!isNil "_eventEnd") then {
					call _eventEnd;
				};

				sleep _waveDelay;
			} else {
				sleep 5;
			};
		} else { // "ATTACK", "STALK"
			_camps select _attackCampIndex params ["_campPos", "_campType", "_campCount", "_campDelay", "_campSafeDistance"];

			if !(_campPos select 0 isEqualType 0) then {
				private _radius = _campPos select 1;
				_campPos = [_campPos select 0] call FUNC(toPosition);
				_campPos = [_campPos, _radius + 50, nil, [_campPos, _radius]] call FUNC(findPosition);
			};

			// TODO Randomize target position if group, unit, or vehicle?
			//      Or lead the target?
			//      Or both?

			if !([_campPos, _safeSpawnDistance] call FUNC(checkVisibility)
				&& (_type == "" || _type == _groupType select 0)) then { // TODO This is problematic, perhaps only check distance?
				if (!_attackWaveStarted) then {
					_attackWaveStarted = true;
					if (!isNil "_eventStart") then {
						call _eventStart;
					};
				};

				private _group = [_campPos, _groupType, _side] call FUNC(createGroup);
				[_group, _loadout, _groupType, _settings] spawn FUNC(initGroup);
				[_group, _target, _groupWaypointSettings, _eventWaypointComplete] spawn FUNC(taskAttack);

				_spawnedGroups pushBack _group;
				_spawnCount = _spawnCount + 1;
				_spawner setVariable ["spawned", _spawnCount];

				if (!isNil "_eventEachWave") then {
					call _eventEachWave;
				};
			} else {
				diag_log text format ["%1: skipping camp %2", _type, _campPos];
				sleep 5;
			};
			_attackCampIndex = _attackCampIndex + 1;
			if (_attackCampIndex >= count _camps) then {
				_attackCampIndex = 0;
				if (_attackWaveStarted) then {
					_attackWaveStarted = false;
					if (!isNil "_eventEnd") then {
						call _eventEnd;
					};
					sleep _waveDelay;
				};
			};
		};
	} else {
		sleep 5;
	};

	_groupIndex = _groupIndex + 1;
	if (_groupIndex >= count _groups) then {
		_groupIndex = 0;
	};
};

private _index = GVAR(spawners) find _spawner;
if (_index != -1) then {
	GVAR(spawners) deleteAt _index;
};

if (GVAR(debug)) then {
	systemChat format ["Spawner %1 has been deleted!", _id];
	{
		deleteMarker _x;
	} forEach (allMapMarkers select { _x find _id != -1 }); // TODO I'm not finding a created marker for this?
};

if (_type == "DEFENSE") then {
	{
		deleteVehicle (_x select 0);
	} forEach (_spawner select _camps);
};

if (_cleanup) then {
	{
		_x params ["_type", "_group"];

		private _fnc_code = {
			// TODO Should this also delete the group's vehicle?
			{
				deleteVehicle _x;
			} forEach units _this;
		};

		[{
			leader _this nearEntities ["CAManBase", GVAR(cleanUpPlayerRadius)] findIf { isPlayer _x } == -1
		}, _fnc_code, _group, 300, _fnc_code] call CBA_fnc_waitUntilAndExecute;
	} forEach _spawnedGroups;
};

_spawner call CBA_fnc_deleteNamespace;
