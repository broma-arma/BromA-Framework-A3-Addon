/*
================================================================================

NAME:
    BRM_FMK_fnc_versionCompare

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Compare version arrays.

PARAMETERS:
    0 - Version (ARRAY of NUMBER)
    1 - Version (ARRAY of NUMBER)

USAGE:
    [[1, 2, 3, 4], [1, 2, 3, 3]] call BRM_FMK_fnc_versionCompare

RETURNS:
    -1 if first parameter is less than the second, 0 if equal, or 1 if greater. (NUMBER)

================================================================================
*/

params ["_versionA", "_versionB"];

private _aLen = count _versionA;
private _bLen = count _versionB;
private _ret = [];

for "_i" from 0 to ((_aLen max _bLen) - 1) do {
	private _a = if (_i < _aLen) then { _versionA select _i } else { 0 };
	private _b = if (_i < _bLen) then { _versionB select _i } else { 0 };
	if (_a < _b) exitWith { -1 };
	if (_a > _b) exitWith { 1 };

	0
};
