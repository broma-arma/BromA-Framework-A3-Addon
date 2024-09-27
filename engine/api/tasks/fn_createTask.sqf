/*
================================================================================

NAME:
    BRM_FMK_fnc_createTask

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Create a task.

PARAMETERS:
    0 - Who will receive the task. (SIDE/GROUP/OBJECT)
    1 - ID of the task or array in the format [ID, parent ID]. (STRING/ARRAY)
    2 - Priority. (NUMBER)
        0: Primary, completion required to complete mission and failure causes mission failure.
        1: Secondary, completion or failure required to complete mission.
        2: Abortive, failure causes mission failure.
        3: Optional, outcome doesn't affect mission outcome.
    3 - Title, description, and type. (ARRAY/STRING)
        ARRAY:
            0 - Title. (STRING)
            1 - Description. (STRING)
            2 - Type: https://community.bistudio.com/wiki/Arma_3:_Task_Framework#Task_Icons (STRING)
        STRING: CfgTaskDescriptions class name. If empty string, task ID is used.
    4 - Position. Use null object, empty string, or empty array for no position: objNull, "", [] (OBJECT/STRING/POSITION/ARRAY)
        OBJECT: Position will change with object movement.
        STRING: Marker name. Position doesn't change if marker is moved.
        ARRAY:
            0 - Object (OBJECT)
            1 - Position update (ARRAY/NUMBER/BOOLEAN)
                NUMBER: Seconds between updating the task position
                ARRAY: Random seconds between updating the task position. [min, max] or [min, mid, max]
                BOOLEAN: Use owner's knowledge of the object.
        POSITION: [x, y] or [x, y, z]
    5 - Conditions. (ARRAY)
        0 - Completion. (CODE/STRING)
        1 - (OPTIONAL) Failure. Default {false} (CODE/STRING)
        2 - (OPTIONAL) Assignment. Default {true} (CODE/STRING)
    6 - (OPTIONAL) Event callbacks. (ARRAY)
        0 - (OPTIONAL) Completed. Default {} (CODE/STRING)
        1 - (OPTIONAL) Failed. Default {} (CODE/STRING)
        2 - (OPTIONAL) Assigned. Default {} (CODE/STRING)

USAGE:
    [side_a_side, "aKillVIP", 1,
        ["Kill the VIP.", "We need to make sure he doesn't spill the beans.", "kill"], vip,
        [{ !alive vip }, { vipEscaped }],
        [{ vipKilled = true; }, { hint "Oops, something bad is going to happen!"; }]
    ] spawn BRM_FMK_fnc_createTask;

    [side_a_side, "aCleanup", 2,
        ["Clean the Beans.", "Clean up the spilt beans.", "destroy"], objNull,
        [{ beansCleaned }, { false }, { vipEscaped }]
    ] spawn BRM_FMK_fnc_createTask;

RETURNS:
    Nothing.

================================================================================
*/

if (!isServer) exitWith {};

params ["_owner", "_ids", "_priority", "_details", "_position", "_predicates", "_callbacks"];

_ids params ["_id", ["_parentId", ""]];

if (_details isEqualType "") then {
	private _cfgTaskDescription = if (_details == "") then {
		[["CfgTaskDescriptions", _id], configfile >> ""] call BIS_fnc_loadClass;
	} else {
		[["CfgTaskDescriptions", _details], configfile >> ""] call BIS_fnc_loadClass;
	};

	private _cfgDescription = _cfgTaskDescription >> "description";
	_details = [
		getText (_cfgTaskDescription >> "title"),
		if (isArray _cfgDescription) then { format getArray _cfgDescription } else { getText _cfgDescription },
		getText (_cfgTaskDescription >> "icon")
	];
};
_details params ["_title", "_desc", "_type"];

if (_position isEqualTo [] || _position isEqualTo "") then {
	_position = objNull;
};

private _positionUpdate = nil;
if (_position isEqualType [] && { _position select 0 isEqualType objNull }) then {
	_position params ["_object", ["_delay", false, [0, false, []], [2, 3]]];
	if (!isNull _object) then {
		if (_delay isEqualType true) then {
			_position = [_object, !_delay];
		} else {
			_positionUpdate = [_id, _position, compile (if (_delay isEqualType []) then {
				if (count _delay > 2) then {
					format (["random [%1, %2, %3]"] + _delay)
				} else {
					format ["random %1 + %2", _delay#1 - _delay#0, _delay#0]
				}
			} else {
				str _delay
			})];
			_position = getPosASL _position;
		};
	};
};

if (_position isEqualType objNull && { !isNull _position }) then {
	// always show marker on the object, even if player doesn't 'knowsAbout' it
	_position = [_position, true];
};

_predicates apply { if (_x isEqualType "") then { compile _x } else { _x }; } params ["_predicateWin", ["_predicateLose", {false}], ["_predicateAssign", {true}]];
_callbacks apply { if (_x isEqualType "") then { compile _x } else { _x }; } params [["_callbackCompleted", {}], ["_callbackFailed", {}], ["_callbackAssigned", {}]];

waitUntil { call _predicateAssign };
call _callbackAssigned;

private _priorityName = ["Primary", "Secondary", "Abortive", "Optional"] select _priority;
[_owner, _ids, [
	format [
		"<font face=""RobotoCondensedLight"">%1: %2.</font><br /><br />",
		_priorityName,
		[
			"Completion required to complete mission and failure causes mission failure",
			"Completion or failure required to complete mission",
			"Failure causes mission failure",
			"Outcome doesn't affect mission outcome"
		] select _priority
	] + _desc,
	format ["(%1) ", _priorityName select [0, 1]] + _title
], _position, false, 0, true, _type, true] call BIS_fnc_taskCreate;

if (!isNil "_positionUpdate") then {
	_positionUpdate spawn {
		params ["_id", "_object", "_delay"];
		while { !(_this call BIS_fnc_taskCompleted) } do {
			sleep call _delay;

			[_id, getPosASL _object] call BIS_fnc_taskSetDestination
		};
	};
};

private _side = switch (typeName _owner) do {
	case "GROUP":  { side _owner };
	case "OBJECT": { _owner call BIS_fnc_objectSide };
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
["BRM_FMK_taskStateChanged", [["a", "b", "c"] select _sideId, _id, "CREATED"]] call CBA_fnc_localEvent;
