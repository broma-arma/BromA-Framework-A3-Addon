#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_taskAttack

Description:
	Task group to attack a target.

Parameters:
	_group - Group [GROUP]
	_target - Target [OBJECT/LOCATION/GROUP/Position]
	_waypointSettings - Waypoint Settings [STRING/ARRAY]
	_onComplete - Statement expression executed when group arrives at the target [STRING]

Returns:
	Nothing

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

params ["_group", "_target", "_waypointSettings", "_onComplete"];

_waypointSettings call BRM_FMK_Plugin_AIS_fnc_getWaypointSettings params [
	"_radius",
	"_searchRadius",
	"_behaviour",
	"_forceBehaviour",
	"_combat",
	"_formation",
	"_speed",
	"_waypointCodeToExecute", // TODO Should this be used?
	"_timeout"
];

_onComplete = toString _onComplete;
if (_onComplete != "") then {
	_onComplete = "if (local group this) then { " + _onComplete + " };";
};

_target = ASLToAGL (_target call BRM_FMK_fnc_getPos);

private _waypoint = [_group, _target, _radius, "MOVE", _behaviour, _combat, _speed, _formation, _onComplete, _timeout] call CBA_fnc_addWaypoint;
if (_forceBehaviour) then {
	_waypoint setWaypointForceBehaviour true;
};

[_group, _target, 3, [_searchRadius, _searchRadius]] call BRM_FMK_Plugin_AIS_fnc_taskPatrol;
