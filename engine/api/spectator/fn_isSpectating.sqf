/*
================================================================================

NAME:
    BRM_FMK_fnc_isSpectating

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Get if player is spectating.

PARAMETERS:
    None

USAGE:
    [] call BRM_FMK_fnc_isSpectating;

RETURNS:
   true if spectating, otherwise false. (BOOLEAN)

================================================================================
*/

if ("ace3_spectator" call BRM_FMK_fnc_isPluginActive) exitWith {
	ace_spectator_isSet
};

["IsSpectating"] call BIS_fnc_EGSpectator
