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
    1 - The ID of the task or array in the format [id, parent id]. (STRING/ARRAY)
    2 - The details of the task. (ARRAY)
        0 - Task title. (STRING)
        1 - Description. (STRING)
        2 - The Type of the Task (STRING)
            See https://community.bistudio.com/wiki/Arma_3:_Task_Framework#Task_icons for task types
        3 - Position of the Task (POSITION/OBJECT/STRING)
            No position will be shown if an empty array/string or null object.
    3 - Conditions. (ARRAY)
        0 - Condition for assignment. (STRING, but must evaluate to BOOLEAN)
        1 - Condition for completion. (STRING, but must evaluate to BOOLEAN)
        2 - Condition for failure. (STRING, but must evaluate to BOOLEAN)
    4 - Task priority. (NUMBER)
        0: Task will be declared "OPTIONAL" and is irrelevant to the mission.
        1: Similar to "OPTIONAL", but they behave as the middle ground, without failing the mission and not being essential to win.
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

params ["_owner", "_id", "_details", "_predicates", "_priority", "_callbacks"];

_details params ["_title", "_desc", "_type", ["_position", objNull, [[], objNull, ""]]];

if (_position isEqualTo [] || _position isEqualTo "") then {
	_position = objNull;
};

if (_position isEqualType "") then {
	_position = markerPos _position;
};

if (_position isEqualType objNull) then {
	if (!isNull _position) then {
		// always show marker on the object, even if player doesn't 'knowsAbout' it
		_position = [_position, true];
	};
};

_predicates apply { if (_x isEqualType "") then { compile _x } else { _x }; } params ["_predicateAssign", "_predicateWin", ["_predicateLose", {false}]];
_callbacks apply { if (_x isEqualType "") then { compile _x } else { _x }; } params ["_callbackAssigned", "_callbackCompleted", "_callbackFailed"];

waitUntil { call _predicateAssign };
call _callbackAssigned;

switch (_priority) do {
	case 0: { _title = format ["(OPTIONAL) %1", _title]; };
	case 2: { _title = format ["(!) %1", _title]; }
};

[_owner, _id, [_desc, _title, ""], _position, false, 0, true, _type, true] call BIS_fnc_taskCreate;

if (_id isEqualType []) then {
	_id = _id select 0;
};

private _side = switch (typeName _owner) do {
	case "GROUP":  { side _owner };
	case "OBJECT": { _owner getVariable ["unit_side", side _owner] };
	case "SIDE":   { _owner };
	default        { ["Invalid task owner, owner side defaulting to 'side_a_side' (%1)", side_a_side] call BIS_fnc_error; side_a_side };
};

private _sideId = switch (_side) do {
	case side_a_side: { 0 };
	case side_b_side: { 1 };
	case side_c_side: { 2 };
	default           { 0 };
};

if (isNil "BRM_FMK_tasks") then { BRM_FMK_tasks = [[], [], []]; };
(BRM_FMK_tasks select _sideId) pushBack [_id, _priority, _predicateWin, _predicateLose, _callbackCompleted, _callbackFailed];
