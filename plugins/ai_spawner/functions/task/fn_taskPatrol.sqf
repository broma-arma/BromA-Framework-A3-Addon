#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_taskPatrol

Description:
	Task group to patrol a target.

Parameters:
	_group - Group [GROUP]
	_target - Target [OBJECT/GROUP/MARKER/LOCATION/POSITION/WAYPOINT/ARRAY]
	_waypointCount - Number of waypoints [STRING/ARRAY]
	_waypointSettings - Waypoint Settings [STRING/ARRAY]

Returns:
	Nothing

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

params ["_group", "_target", "_waypointCount", "_waypointSettings"];

_waypointSettings call BRM_FMK_Plugin_AIS_fnc_getWaypointSettings params [
	"_radius",
	"_searchRadius", // TODO Should this be used?
	"_behaviour",
	"_forceBehaviour",
	"_combat",
	"_formation",
	"_speed",
	"_onComplete",
	"_timeout",
	"_compRadius"
];

if (_onComplete isEqualType {}) then {
	_onComplete = toString _onComplete;
};
if (_onComplete != "") then {
	_onComplete = "if (local group this) then { " + _onComplete + " };";
};

private _firstWaypoint = nil;
for "_i" from 1 to _waypointCount do {
	private _position = [_target, 0, 0, [10, nil] select isNull objectParent leader _group] call BRM_FMK_Plugin_AIS_fnc_findPosition;
	if (_position isEqualTo []) then { _position = _target call BRM_FMK_fnc_getPos; };
	private _waypoint = [_group, _position, _radius, "MOVE", _behaviour, _combat, _speed, _formation, _onComplete, _timeout] call CBA_fnc_addWaypoint;
	if (_forceBehaviour) then {
		_waypoint setWaypointForceBehaviour true;
	};
	switch (_i) do {
		case 1: { _firstWaypoint = _waypoint; };
		case _waypointCount: { [_group, waypointPosition _firstWaypoint, 0, "CYCLE"] call CBA_fnc_addWaypoint; }; // CYCLE cycles to closest waypoint
	};
};
