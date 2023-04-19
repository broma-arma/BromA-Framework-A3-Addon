#include "script_component.hpp"
/*
================================================================================

NAME:
    BRM_FMK_fnc_joinDeadGroup

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Causes the player to join a side specific group for the dead.

PARAMETERS:
    0 - Player (OBJECT)

USAGE:
    [player] call BRM_FMK_fnc_joinDeadGroup

RETURNS:
    Nothing

================================================================================
*/

params ["_unit"];

if (isNil "_unit" || { isNull _unit }) exitWith {};

if !(isServer) exitWith { _this remoteExec [QFUNCMAIN(joinDeadGroup), 2]; };

if (isNil QGVARMAIN(deadGroups)) then { GVARMAIN(deadGroups) = []; };

private _side = _unit getVariable ["unit_side", side _unit];
private _group = [GVARMAIN(deadGroups), str _side, grpNull] call BIS_fnc_getFromPairs;
if (isNull _group) then {
	_group = createGroup [_side, true];
	_group setGroupIdGlobal ["Dead"];
	[GVARMAIN(deadGroups), str _side, _group] call BIS_fnc_setToPairs;
};

[_unit] joinSilent _group;
