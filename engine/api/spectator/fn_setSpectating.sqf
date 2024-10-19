/*
================================================================================

NAME:
    BRM_FMK_fnc_setSpectating

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Start or stop spectating.

PARAMETERS:
    0 - true to start, false to stop (BOOLEAN)

USAGE:
    [true] call BRM_FMK_fnc_setSpectating;

RETURNS:
   Nothing.

================================================================================
*/

params [["_set", true, [true]]];

if (_set == [] call BRM_FMK_fnc_isSpectating) exitWith {};

if (_set) then {
	[{ [player] call BRM_FMK_Engine_fnc_initSpectator; }] call CBA_fnc_execNextFrame;
} else {
	[player] call BRM_FMK_Engine_fnc_endSpectator;
};
