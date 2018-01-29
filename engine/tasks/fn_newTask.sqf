/*
================================================================================

NAME:
    BRM_FMK_fnc_newTask

AUTHOR(s):
    Nife

DESCRIPTION:
    Adds a new task.

PARAMETERS:
    0 - Assignees: who will the task be assigned to. (SIDE/GROUP/UNIT)
    1 - The ID of the task. (STRING)
    2 - The details of the task. (ARRAY)
        0 - Task title. (STRING)
        1 - Description. (STRING)
        2 - The Type of the Task (STRING)
            Current available types are:
                "Default", "Attack", "Defend", "Destroy", "Interact", "Move", "Search", "Support"
        3 - Position of the Task (ARRAY/POSITION)
                If left empty no position will be shown.
    3 - Conditions. (ARRAY)
        0 - Condition for assignment. (STRING, but must evaluate to BOOLEAN)
        1 - Condition for completion. (STRING, but must evaluate to BOOLEAN)
        2 - Condition for failure. (STRING, but must evaluate to BOOLEAN)
    4 - Task priority. (NUMBER)
        0: Task will be declared "OPTIONAL" and is irrelevant to the mission.
        1: Similar to "OPTIONAL", but they behave as the middle ground,
        without failing the mission and not being essential to win.
        2: Essential tasks, which cannot be failed and must be completed.
    5 - Task event callback. (ARRAY)
        0 - Code executed when the task is assigned to the players. (STRING, but must evaluate to CODE)
        1 - Code executed whenever the mission is completed. (STRING, but must evaluate to CODE)
        2 - Code executed whenever the mission fails.

USAGE:
    [
        side_a_side,
        "newTaskVIPKill",
        "destroy",
        (getPos VIP),
        ["Kill the VIP.",
        "We need to make sure he doesn't spills the beans."],
        ["(true)","!(alive VIP)", "(VIPhasEscaped)"],
        1,
        ["","goodVariable = true","hint 'Oops, something bad is going to happen!"]
    ] spawn BRM_FMK_fnc_newTask;

RETURNS:
    Nothing.

================================================================================
*/

if (!isServer) exitWith {};

params ["_side", "_id", "_details", "_cond", "_priority", "_callback"];

_details params ["_title", "_desc", "_type", ["_position", objNull, [[]]]];
if (count _position == 0) then { _position = objNull; };

_cond = _cond apply { compile _x };
_cond params ["_condAssign", "_condWin", ["_condLose", {false}]];

_callback = _callback apply { compile _x };
_callback params ["_cbAssigned", "_cbCompleted", "_cbFailed"];

waitUntil { call _condAssign };
call _cbAssigned;

switch (_priority) do {
	case 0: { _title = format ["(OPTIONAL) %1", _title]; };
	case 2: { _title = format ["(!) %1", _title]; }
};

[_side, _id, [_desc, _title, ""], _position, false, 0, true, _type, true] call BIS_fnc_taskCreate;

_side = switch (typeName _side) do {
	case "GROUP":  { side _side };
	case "OBJECT": { _side getVariable ["unit_side", side _side] };
	case "SIDE":   { _side };
	default        { side_a_side };
};

private _sideId = switch (_side) do {
	case side_a_side: { 0 };
	case side_b_side: { 1 };
	case side_c_side: { 2 };
	default           { 0 };
};

if (isNil "BRM_FMK_tasks") then { BRM_FMK_tasks = [[], [], []]; };
(BRM_FMK_tasks select _sideId) pushBack [_id, _priority, _condWin, _condLose, _cbCompleted, _cbFailed];
