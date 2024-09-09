/*
================================================================================

NAME:
    BRM_FMK_fnc_alive

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Check if a unit is alive.

PARAMETERS:
    0 - Name (STRING)

USAGE:
    player call BRM_FMK_fnc_alive

RETURNS:
   true if alive, otherwise false. (BOOLEAN)

================================================================================
*/

params [["_unit", objNull, [objNull]]];

alive _unit && { !(_unit getVariable ["isDead", false]) }
