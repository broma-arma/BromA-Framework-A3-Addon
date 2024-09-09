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

if !(isServer) exitWith { _this remoteExec ["BRM_FMK_fnc_joinDeadGroup", 2]; };

if (isNil "BRM_FMK_deadGroups") then { BRM_FMK_deadGroups = createHashMap; };

private _side = _unit getVariable ["unit_side", side _unit];
private _group = BRM_FMK_deadGroups getOrDefault [_side, grpNull];
if (isNull _group) then {
	_group = createGroup [_side, true];
	_group setGroupIdGlobal ["Dead"];
	BRM_FMK_deadGroups set [_side, _group];
};

[_unit] joinSilent _group;
