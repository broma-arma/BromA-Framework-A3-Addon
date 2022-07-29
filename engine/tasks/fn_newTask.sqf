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

if ([BRM_version, [0, 7, 5]] call BRM_FMK_fnc_versionCompare <= 0 && count _this == 6) then {
	params ["_owner", "_id", "_details", "_predicates", "_priority", "_callbacks"];

	_details params ["_title", "_description", "_type", ["_position", objNull, [[], objNull, ""]]];

	_predicates apply { if (_x isEqualType "") then { compile _x } else { _x }; } params ["_predicateAssign", "_predicateComplete", ["_predicateFail", {false}]];
	_callbacks apply { if (_x isEqualType "") then { compile _x } else { _x }; } params ["_callbackAssigned", "_callbackCompleted", "_callbackFailed"];

	private _missionComplete = true;
	private _missionFail = true;

	if (_priority == 0) then {
		_missionComplete = false;
		_missionFail = false;
	};
	if (_priority == 1) then {
		_missionComplete = true;
		_missionFail = false;
	};

	_this = [
		_owner, _id, _title, _description, _type, _position, _missionComplete, _missionFail,
		[_predicateAssign, _predicateComplete, _predicateFail],
		[_callbackAssigned, _callbackCompleted, _callbackFailed]
	];
};

params [
	["_owners", true, [true, sideUnknown, grpNull, objNull, [], ""]],
	["_id", "", [[], ""]],
	["_title", "", [""]],
	["_description", "", [""]],
	["_type", "Default", [""]],
	["_position", [objNull, false], [objNull, [], ""]],
	["_missionComplete", true, [true, ""]],
	["_missionFail", true, [true, ""]],
	["_predicates", [], [[]]],
	["_callbacks", [], [[]]]
];

if (_id isEqualTo [] || _id isEqualTo "") exitWith {};

private _taskID = if (_id isEqualType []) then { _id select 0 } else { _id };

if (_taskID isEqualTo "") exitWith {};

_predicates params [["_predicateAssign", {true}, [{}]], ["_predicateComplete", {false}, [{}]], ["_predicateFail", {false}, [{}]]];
_callbacks params [["_callbackAssigned", {}, [{}]], ["_callbackCompleted", {}, [{}]], ["_callbackFailed", {}, [{}]]];

if (_position isEqualTo [] || _position isEqualTo "") then {
	_position = objNull;
};

if (_position isEqualType objNull && { !isNull _position }) then {
	// always show marker on the object, even if player doesn't 'knowsAbout' it
	_position = [_position, true];
};

private _sides = [];
private _fnc_owners = nil;
_fnc_owners = {
	private _owners = [];
	switch (true) do {
		case (_this isEqualType true): {
			if (_this) then {
				_owners pushBack _this;
				_sides append [WEST, EAST, INDEPENDENT, CIVILIAN];
			};
		};
		case (_this isEqualType objNull): {
			_owners pushBack (_this call BIS_fnc_objectVar);
			_sides pushBack side _this;
		};
		case (_this isEqualType grpNull): {
			_sides pushBack side _this;
			_owners pushBack _this;
		};
		case (_this isEqualType sideUnknown): {
			_owners pushBack _this;
			_sides pushBack _this;
		};
		case (_this isEqualType ""): {
			_owners pushBack _this;
			private _obj = missionNamespace getVariable [_this, objNull];
			if (!isNull _obj) then {
				_sides pushBack side _obj;
			};
		};
		case (_this isEqualType []): {
			{
				_owners append (_x call _fnc_owners);
			} foreach _this;
		};
	};
	_owners
};
_owners = _owners call _fnc_owners;
_owners = _owners arrayIntersect _owners;
_sides = _sides arrayIntersect _sides;
private _validSides = [side_a_side, side_b_side];
if (side_c_faction != "") then {
	_validSides pushBack side_c_side;
};
_sides = _sides select { _x in _validSides };
if (count _sides == 0) then {
	["[BromA Framework] Error: Could not determine side for task ""%1"".", _taskID] call BIS_fnc_error;
};

private _sideChars = _sides apply { ["a", "b", "c"] select ([side_a_side, side_b_side, side_c_side] find _x) };

private _endingComplete = "";
if (_missionComplete isEqualType "") then {
	_endingComplete = _missionComplete;
	_missionComplete = _missionComplete != "";
};
if (_endingComplete == "") then {
	if (mission_game_mode == "coop") then {
		if (side_a_side in _sides) then {
			_endingComplete = "victory";
		};
	} else {
		if (count _sideChars == 1) then {
			_endingComplete = format ["side_%1_victory", _sideChars select 0];
		} else {
			if (count _sideChars == 2) then {
				_endingComplete = format ["side_%1_defeat", (["a", "b", "c"] - _sideChars) select 0];
			} else {
				_endingComplete = "victory";
			};
		};
	};
};

private _endingFail = "";
if (_missionFail isEqualType "") then {
	_endingFail = _missionFail;
	_missionFail = _missionFail != "";
};
if (_endingFail == "") then {
	if (mission_game_mode == "coop") then {
		if (side_a_side in _sides) then {
			_endingFail = "defeat";
		};
	} else {
		if (count _sideChars == 1) then {
			_endingFail = format ["side_%1_defeat", _sideChars select 0];
		} else {
			if (count _sideChars == 2) then {
				_endingFail = format ["side_%1_victory", (["a", "b", "c"] - _sideChars) select 0];
			} else {
				_endingFail = "defeat";
			};
		};
	};
};

private _missionCondition = [["(O)ptional", "(A)bortive"], ["(S)econdary", "(P)rimary"]] select _missionComplete select _missionFail;
_description = format [
	"<i>%1: %2 to win and %3 fail the mission.</i><br /><br />",
	_missionCondition,
	["Not required", "Required"] select _missionComplete,
	["doesn't", "can"] select _missionFail
] + _description;
_title = (_missionCondition select [0, 3]) + _title;

if (isNil "BRM_FMK_tasks") then { BRM_FMK_tasks = []; };
BRM_FMK_tasks pushBack [_taskID,
	_sides, _owners, _id, _title, _description, _type, _position, _missionComplete, _missionFail, _endingComplete, _endingFail,
	_predicateAssign, _predicateComplete, _predicateFail,
	_callbackAssigned, _callbackCompleted, _callbackFailed
];
