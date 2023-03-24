/*
================================================================================

NAME:
    BRM_FMK_fnc_clearWaypoints

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Clear group waypoints.

PARAMETERS:
    0 - Group (GROUP)

USAGE:
    _group call BRM_FMK_fnc_clearWaypoints;

RETURNS:
    Nothing.

================================================================================
*/

params ["_group"];

// Don't delete initial position waypoint, 0.
for "_i" from count waypoints _group - 1 to 1 step -1 do {
	deleteWaypoint [_group, _i];
};

if (units _group findIf { alive _x } != -1) then {
	// Stop movement to deleted waypoint.
	private _waypoint = _group addWaypoint [leader _group, -1];
	_waypoint setWaypointStatements ["true", "deleteWaypoint [group this, currentWaypoint group this]"];
};
