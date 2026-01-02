/*
================================================================================

NAME:
    BRM_FMK_fnc_distance

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Get distance between two entities.

PARAMETERS:
    0 - Entity (OBJECT / GROUP / MARKER / LOCATION / POSITION / CONTROL / WAYPOINT / ARRAY)
    1 - Entity (OBJECT / GROUP / MARKER / LOCATION / POSITION / CONTROL / WAYPOINT / ARRAY)

USAGE:
    [player, target] call BRM_FMK_fnc_distance;

RETURNS:
    distance (NUMBER)

================================================================================
*/

params [
	["_a", [], [objNull, grpNull, "", locationNull, 0, controlNull, []]],
	["_b", [], [objNull, grpNull, "", locationNull, 0, controlNull, []]]
];

_a call BRM_FMK_fnc_getPos vectorDistance (_b call BRM_FMK_fnc_getPos)
