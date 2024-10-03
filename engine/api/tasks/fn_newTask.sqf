/*
================================================================================

DEPRECATED:
    Use BRM_FMK_fnc_createTask.

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
            See https://community.bistudio.com/wiki/Arma_3:_Task_Framework#Task_Icons for task types
        3 - Position of the Task (POSITION/OBJECT/STRING)
            No position will be shown if an empty array/string or null object.
    3 - Conditions. (ARRAY)
        0 - Condition for assignment. (STRING, but must evaluate to BOOLEAN)
        1 - Condition for completion. (STRING, but must evaluate to BOOLEAN)
        2 - Condition for failure. (STRING, but must evaluate to BOOLEAN)
    4 - Task priority. (NUMBER)
        2 - Primary, completion required to complete mission and failure causes mission failure.
        0 - Secondary, completion or failure required to complete mission.
        3 - Abortive, failure causes mission failure.
        1 - Optional, outcome doesn't affect mission outcome.
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

params ["_owner", "_id", "_details", "_predicates", "_priority", "_callbacks"];

_details params ["_title", "_desc", "_type", ["_position", objNull, [[], objNull, ""]]];

_predicates params ["_predicateAssign", "_predicateWin", ["_predicateLose", {false}]];
_callbacks params ["_callbackAssigned", "_callbackCompleted", "_callbackFailed"];

[
	_owner, _id, [1, 3, 0, 2] select _priority,
	[_title, _desc, _type], _position,
	[_predicateWin, _predicateLose, _predicateAssign],
	[_callbackCompleted, _callbackFailed, _callbackAssigned]
] call BRM_FMK_fnc_createTask
