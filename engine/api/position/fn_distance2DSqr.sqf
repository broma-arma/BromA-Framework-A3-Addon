/*
================================================================================

NAME:
    BRM_FMK_fnc_distance2DSqr

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Get 2D squared distance between two entities.

PARAMETERS:
    0 - Entity (OBJECT / GROUP / MARKER / LOCATION / POSITION / CONTROL / WAYPOINT / ARRAY)
    1 - Entity (OBJECT / GROUP / MARKER / LOCATION / POSITION / CONTROL / WAYPOINT / ARRAY)

USAGE:
    [player, target] call BRM_FMK_fnc_distance2DSqr;

RETURNS:
    2D squared distance (NUMBER)

================================================================================
*/

params [["_a", [], [objNull, grpNull, "", locationNull, 0, controlNull, []]]];
params [["_b", [], [objNull, grpNull, "", locationNull, 0, controlNull, []]]];

_a call BRM_FMK_fnc_getPos select [0, 2] vectorDistanceSqr (_b call BRM_FMK_fnc_getPos select [0, 2])
