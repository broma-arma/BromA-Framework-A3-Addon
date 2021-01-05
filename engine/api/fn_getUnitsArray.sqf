#include "component.hpp"
/*
================================================================================

DEPRECATED:
    Use: [_side, "units"] call BRM_FMK_fnc_getSideInfo

NAME:
    BRM_FMK_fnc_getUnitsArray

AUTHOR(s):
    Nife

DESCRIPTION:
    Returns an array containing unit class names for the side

PARAMETERS:
    0 - Side to get the unit class names of. (SIDE)

USAGE:
    [WEST] call BRM_FMK_fnc_getUnitsArray;

RETURNS:
    An array containing unit class names for the side. (ARRAY)

================================================================================
*/

params [["_side", WEST, [WEST]]];

[_side, "units"] call BRM_FMK_fnc_getSideInfo
