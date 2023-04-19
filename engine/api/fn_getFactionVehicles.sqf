#include "script_component.hpp"
/*
================================================================================

DEPRECATED:
    Use BRM_FMK_fnc_appendIndices.

NAME:
    BRM_FMK_fnc_getFactionVehicles

AUTHOR(s):
    Nife

DESCRIPTION:
    'Alias' for appendIndices

PARAMETERS:
    0 - Source array (ARRAY)
    1 - Indices (ARRAY)

USAGE:
    ["Hello", "Foo", "World"] = [[["Hello"], ["Foo"], ["Bar"], ["World"]], [0, 1, 3]] call BRM_FMK_fnc_getFactionVehicles;

RETURNS:
    Array containing the specified indices appended together (ARRAY)

================================================================================
*/

_this call FUNCMAIN(appendIndices);
