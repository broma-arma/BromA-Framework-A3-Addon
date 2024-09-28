/*
================================================================================

NAME:
    BRM_FMK_fnc_setTask

AUTHOR(s):
    Nife

DESCRIPTION:
    Sets a task's state over the network.

PARAMETERS:
    0 - Task ID (STRING)
    1 - Desired state (STRING)

USAGE:
    ["myTaskID", "FAILED"] call BRM_FMK_fnc_setTask

RETURNS:
    true if task exists and state was changed. (BOOLEAN)

================================================================================
*/

if (!isServer) exitWith {};

params ["_id", "_state"];

private _task = BRM_FMK_Engine_tasks get _id;
if (isNil "_task" || { [_id] call BIS_fnc_taskState == _state }) exitWith { false };

[_id, toUpper _state, true] call BIS_fnc_taskSetState;

private _index = switch (_state) do {
	case "SUCCEEDED": { 12 };
	case "FAILED";
	case "CANCELED":  { 13 };
	default           { -1 };
};
if (_index != -1) then {
	call (_task select _index);
};

true
