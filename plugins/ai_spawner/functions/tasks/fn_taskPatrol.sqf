#include "script_component.hpp"
diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_group", "_zone", "_waypointCount", "_waypointSettings"];

if (_waypointSettings isEqualType "") then {
	_waypointSettings = GVAR(waypointSettings) get _waypointSettings;
};

_waypointSettings params [
	"_radius",
	"_searchRadius", // TODO Should this be used?
	"_behaviour",
	"_combat",
	"_formation",
	"_speed",
	"_onComplete",
	"_timeout"
];

// TODO Move into function
//      Don't use CBA_fnc_clearWaypoints, it causes waypoint re-indexing while deleting.
//      Should also do this for the other task functions.
for "_i" from count waypoints _group - 1 to 0 step -1 do {
	deleteWaypoint [_group, _i];
};

private _positionBlacklist = [];
for "_i" from 1 to _waypointCount do {
	if (_i == _waypointCount && { _i > 1 }) then {
		_positionBlacklist pushBack [waypointPosition [_group, 0], 20]; // TODO Same as below
	};
	private _position = [_zone, 0, [nil, 10] select !isNull objectParent leader _group, _positionBlacklist] call FUNC(findPosition);

	// Force waypoints to be a minimum distance away from each other, so don't end up with a group
	// cycling through waypoints that ended up being within completion radius of each other.
	// TODO Minimum waypoint distance based on waypoint completion radius
	//      Completion distance seems to also rely on object config, so using just `_radius`/`waypointCompletionRadius` won't work.
	_positionBlacklist set [0, [_position, 20]];

	private _waypoint = [_group, _position, _radius, "MOVE", _behaviour, _combat, _speed, _formation, _onComplete, _timeout] call CBA_fnc_addWaypoint;

	if (_i == _waypointCount) then {
		[_group, waypointPosition _waypoint vectorAdd [0, 1, 0], 0, "CYCLE"] call CBA_fnc_addWaypoint;
	};
};
