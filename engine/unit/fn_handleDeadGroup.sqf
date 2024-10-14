/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_handleDeadGroup

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Handles player joining or leaving a side specific group for the dead.

PARAMETERS:
    0 - Player (OBJECT)

USAGE:
    [player] call BRM_FMK_Engine_fnc_handleDeadGroup

RETURNS:
    Nothing

================================================================================
*/

params ["_unit", ["_leave", false]];

if (isNil "_unit" || { isNull _unit }) exitWith {};

if !(isServer) exitWith { _this remoteExec ["BRM_FMK_Engine_fnc_handleDeadGroup", 2]; };

if (_leave) exitWith {
	private _respawnGroup = _unit getVariable ["BRM_FMK_Engine_fnc_handleDeadGroup_respawnGroup", grpNull];
	[_unit] joinSilent _respawnGroup;
	deleteVehicle (_respawnGroup getVariable ["BRM_FMK_Engine_fnc_handleDeadGroup_logic", objNull]);
};

if (isNil "BRM_FMK_deadGroups") then { BRM_FMK_deadGroups = createHashMap; };

private _side = _unit call BIS_fnc_objectSide;
private _deadGroup = BRM_FMK_deadGroups getOrDefault [_side, grpNull];
if (isNull _deadGroup) then {
	_deadGroup = createGroup [_side, true];
	_deadGroup setGroupIdGlobal ["Dead"];
	BRM_FMK_deadGroups set [_side, _deadGroup];
};

_unit setVariable ["BRM_FMK_Engine_fnc_handleDeadGroup_respawnGroup", group _unit];

private _group = group _unit;
if (units _group isEqualTo [_unit]) then {
	// Prevent empty group deletion
	private _logic = _group createUnit ["Logic", [0, 0, 5], [], 0, "CAN_COLLIDE"];
	_group setVariable ["BRM_FMK_Engine_fnc_handleDeadGroup_logic", _logic];
};
[_unit] joinSilent _deadGroup;
