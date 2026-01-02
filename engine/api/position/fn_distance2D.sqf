/*
================================================================================

NAME:
    BRM_FMK_fnc_distance2D

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Get 2D distance between two entities.

PARAMETERS:
    0 - Entity (OBJECT / GROUP / MARKER / LOCATION / POSITION / CONTROL / WAYPOINT / ARRAY)
    1 - Entity (OBJECT / GROUP / MARKER / LOCATION / POSITION / CONTROL / WAYPOINT / ARRAY)

USAGE:
    [player, target] call BRM_FMK_fnc_distance2D;

RETURNS:
    2D distance (NUMBER)

================================================================================
*/

params [
	["_a", [], [objNull, grpNull, "", locationNull, 0, controlNull, []]],
	["_b", [], [objNull, grpNull, "", locationNull, 0, controlNull, []]]
];

_a call BRM_FMK_fnc_getPos select [0, 2] vectorDistance (_b call BRM_FMK_fnc_getPos select [0, 2])
