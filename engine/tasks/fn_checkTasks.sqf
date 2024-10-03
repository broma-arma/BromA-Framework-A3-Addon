/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_checkTasks

AUTHOR(s):
    Nife

DESCRIPTION:
    Runs a server-side check that evaluates the conditions for all assigned
    tasks, followed by the appropriate functions.

PARAMETERS:
    Nothing.

USAGE:
    [] spawn BRM_FMK_Engine_fnc_checkTasks

RETURNS:
    Nothing;

================================================================================
*/

#define PRIORITY_PRIMARY   0 // Completion required to complete mission and failure causes mission failure.
#define PRIORITY_SECONDARY 1 // Completion or failure required to complete mission.
#define PRIORITY_ABORTIVE  2 // Failure causes mission failure.
#define PRIORITY_OPTIONAL  3 // Outcome doesn't affect mission outcome.

params ["_args", "_handle"];

if (!mission_running) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

// a, b, c
private _sideTasks = [0, 0, 0];
private _sideMainTasks = [0, 0, 0];

private _init = getClientStateNumber > 0 && getClientStateNumber < 10;

{
	if (!mission_running) exitWith {};

	private _id = _x;

	private _taskState = [_id] call BIS_fnc_taskState;

	private _task = BRM_FMK_Engine_taskData get _id;

	_sideTasks set [_task#0, _sideTasks#(_task#0) + 1];

	if (_taskState == "FAILED" || _taskState == "CANCELED") then { continue; };

	_task params [
		"_sideId", "_owner", "_parentId", "_priority", "_texts",
		"_type", "_position", "_positionUpdate", "_nextPositionUpdate",
		"_predicateWin", "_predicateLose", "_predicateAssign",
		"_callbackCompleted", "_callbackFailed", "_callbackAssigned"
	];

	private _sideChar = ["a", "b", "c"] select _sideId;

	if (_taskState == "") then {
		if ([] call _predicateAssign) then {
			[] call _callbackAssigned;

			_init = true;
			_taskState = "CREATED";
			[_owner, [_id, _parentId], _texts, _position, false, 0, true, _type, true] call BIS_fnc_taskCreate;
			["BRM_FMK_taskStateChanged", [_sideChar, _id, "CREATED"]] call CBA_fnc_localEvent;
		} else {
			continue;
		};
	};

	if (!isNil "_positionUpdate" && { _taskState != "SUCCEEDED" && { time >= _nextPositionUpdate }}) then {
		_positionUpdate params ["_object", "_delay"];

		if (!isNull _object) then {
			[_id, getPosASL _object] call BIS_fnc_taskSetDestination;
			_task set [/*_nextPositionUpdate*/8, time + call _delay];
		} else {
			_task set [/*_positionUpdate*/7, nil];
		};
	};

	if (_init) then { continue; };

	if (call _predicateLose) then {
		if (_priority == PRIORITY_PRIMARY || _priority == PRIORITY_ABORTIVE) then {
			_taskState = "FAILED";
			[_id, _taskState, true] call BIS_fnc_taskSetState;
			call _callbackFailed;
			["BRM_FMK_taskStateChanged", [_sideChar, _id, _taskState]] call CBA_fnc_localEvent;

			if (mission_game_mode == "coop") then {
				if (_sideChar == "a") then {
					[endings_defeat] call BRM_FMK_fnc_endMission;
				};
			} else {
				[missionNamespace getVariable format ["endings_tvt_side_%1_defeat", _sideChar]] call BRM_FMK_fnc_endMission;
			};
		} else { // PRIORITY_SECONDARY or PRIORITY_OPTIONAL
			_taskState = "CANCELED";
			[_id, _taskState, true] call BIS_fnc_taskSetState;
			call _callbackFailed;
			["BRM_FMK_taskStateChanged", [_sideChar, _id, _taskState]] call CBA_fnc_localEvent;
		};

		continue;
	};

	if (_taskState != "SUCCEEDED") then {
		if (call _predicateWin) then {
			_taskState = "SUCCEEDED";
			[_id, _taskState, true] call BIS_fnc_taskSetState;
			call _callbackCompleted;
			["BRM_FMK_taskStateChanged", [_sideChar, _id, _taskState]] call CBA_fnc_localEvent;
		};

		if (_priority == PRIORITY_PRIMARY || _priority == PRIORITY_SECONDARY) then {
			_sideMainTasks set [_sideId, _sideMainTasks#_sideId + 1];
		};
	};
} forEach BRM_FMK_Engine_tasks;

if (!mission_running) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

if (_init) exitWith {};

{
	if (_sideTasks#_forEachIndex > 0 && _x == 0) then {
		private _sideChar = ["a", "b", "c"] select _forEachIndex;
		if ((missionNamespace getVariable format ["side_%1_side", _sideChar]) in mission_require_extraction) then {
			missionNamespace getVariable format ["brm_fmk_extraction_%1", _sideChar] params ["_extractionObjects", "_extractionTargets"];

			if (count _extractionTargets > 0) then {
				[missionNamespace getVariable format ["side_%1_side", _sideChar], format ["%1Extract", _sideChar], PRIORITY_PRIMARY,
					"Regroup", objNull,
					[format ["!(side_%1_side in mission_require_extraction)", _sideChar]],
					[{}, {}, { if (mission_extraction_enable_music) then { [selectRandom mission_extraction_tracks] call BRM_FMK_fnc_playGlobal; }; }]
				] spawn BRM_FMK_fnc_createTask;

				[
					_extractionObjects apply { if (_x isEqualType "") then { call compile _x } else { _x } },
					_extractionTargets,
					compile format ["mission_require_extraction = mission_require_extraction - [side_%1_side];", _sideChar],
					100,
					10
				] call BRM_FMK_fnc_reachTarget;
			} else {
				["CLIENTS", "CHAT", format ["WARNING: Skipping extraction task. Mission requires extraction, but has no extraction points for %1.", missionNamespace getVariable format ["side_%1_side", _sideChar]]] call BRM_FMK_fnc_doLog;
				mission_require_extraction = mission_require_extraction - [missionNamespace getVariable format ["side_%1_side", _sideChar]];
			};
		} else {
			if (mission_game_mode != "coop") then {
				[missionNamespace getVariable format ["endings_tvt_side_%1_victory", _sideChar]] call BRM_FMK_fnc_endMission;
			} else {
				if (_sideChar == "a") then {
					[endings_victory] call BRM_FMK_fnc_endMission;
				};
			};
		};
	};
} forEach _sideMainTasks;
