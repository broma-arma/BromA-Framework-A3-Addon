#include "component.hpp"
/*
================================================================================

NAME:
    BRM_FMK_fnc_weaponAway

AUTHOR(s):
    commy2

DESCRIPTION:
    The unit will put its current weapon away.

PARAMETERS:
    0 - What unit should put the current weapon on back? (OBJECT)

USAGE:
    [player] call BRM_FMK_fnc_weaponAway

RETURNS:
    Nothing.

================================================================================
*/

params [["_unit", objNull, [objNull]]];

_unit action ["SwitchWeapon", _unit, _unit, -1];
