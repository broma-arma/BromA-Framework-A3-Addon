#include "script_component.hpp"
/*
================================================================================

NAME:
    BRM_FMK_fnc_hasActiveCrew

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Get if a vehicle has an active driver, gunner, commander, or non FFV turret.

PARAMETERS:
    0 - Vehicle (OBJECT)

USAGE:
    _vehicle call BRM_FMK_fnc_hasActiveCrew;

RETURNS:
    true if the vehicle has active crew, otherwise false. (BOOL)

================================================================================
*/

params ["_vehicle"];

fullCrew _vehicle findIf {
	_x params ["_unit", "_role", "", "", "_personTurret"];

	alive _unit && _role != "cargo" && !_personTurret
} == -1
