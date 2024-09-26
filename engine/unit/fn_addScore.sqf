/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_addScore

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Adds a number to the score of a unit. Negative values will remove from the score.

PARAMETERS:
    0 - Unit to add score to. (OBJECT)
    1 - Score to add. (NUMBER)

USAGE:
    [player, 1] call BRM_FMK_Engine_fnc_addScore;

RETURNS:
    Nothing.

================================================================================
*/

params ["_unit", "_score"];

_unit setVariable ["unit_score", (_unit getVariable ["unit_score", 0]) + _score];
