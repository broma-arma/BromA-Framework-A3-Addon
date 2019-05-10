/*
================================================================================

NAME:
    BRM_FMK_fnc_appendIndices

AUTHOR(s):
    Nife

DESCRIPTION:
    Returns an array of the specified indices appended together.

PARAMETERS:
    0 - Source array (ARRAY)
    1 - Indices (ARRAY)

USAGE:
    ["Hello", "Foo", "World"] = [[["Hello"], ["Foo"], ["Bar"], ["World"]], [0, 1, 3]] call BRM_FMK_fnc_appendIndices;

RETURNS:
    Array containing the specified indices appended together (ARRAY)

================================================================================
*/

params [["_array", [], [[]]], ["_indices", [], [[]]]];

private _result = [];
{
	_result append (_array select _x);
} forEach _indices;

_result
