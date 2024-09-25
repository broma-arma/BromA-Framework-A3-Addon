/*
================================================================================

NAME:
    BRM_FMK_fnc_checkTasks

AUTHOR(s):
    Nife

DESCRIPTION:
    Runs a server-side check that evaluates the conditions for all assigned
    tasks, followed by the appropriate functions.

PARAMETERS:
    Nothing.

USAGE:
    [] spawn BRM_FMK_fnc_checkTasks

RETURNS:
    Nothing;

================================================================================
*/

#define PRIORITY_PRIMARY   2 // Completion required to complete mission and failure causes mission failure.
#define PRIORITY_SECONDARY 0 // Completion or failure required to complete mission.
#define PRIORITY_ABORTIVE  3 // Failure causes mission failure.
#define PRIORITY_OPTIONAL  1 // Outcome doesn't affect mission outcome.

if (!isServer) exitWith {};

if (isNil "BRM_FMK_tasks") then { BRM_FMK_tasks = [[], [], []]; };

private _endDelayeds = [false, false, false];

while { mission_running } do {
	{
		if !(mission_running) exitWith {};

		if (count _x > 0) then {
			private _sideChar = ["a", "b", "c"] select _forEachIndex;

			private _remainingPrimarySecondary = 0;
			{
				_x params ["_id", "_priority", "_predicateWin", "_predicateLose", "_callbackCompleted", "_callbackFailed"];

				private _taskState = [_id] call BIS_fnc_taskState;
				if (_taskState != "FAILED" && _taskState != "CANCELED") then {
					if (call _predicateLose) then {
						if (_priority > 1) then { // PRIORITY_PRIMARY or PRIORITY_ABORTIVE
							[_id, "FAILED", true] call BIS_fnc_taskSetState;
							call _callbackFailed;
							["BRM_FMK_taskStateChanged", [_sideChar, _id, "FAILED"]] call CBA_fnc_localEvent;

							if (mission_game_mode != "coop") then {
								[missionNamespace getVariable format ["endings_tvt_side_%1_defeat", _sideChar]] call BRM_FMK_fnc_endMission;
							} else {
								if (_sideChar == "a") then {
									[endings_defeat] call BRM_FMK_fnc_endMission;
								};
							};
						} else { // PRIORITY_SECONDARY or PRIORITY_OPTIONAL
							[_id, "CANCELED", true] call BIS_fnc_taskSetState;
							call _callbackFailed;
							["BRM_FMK_taskStateChanged", [_sideChar, _id, "CANCELED"]] call CBA_fnc_localEvent;
						};
					} else {
						if (_taskState != "SUCCEEDED") then {
							if (call _predicateWin) then {
								[_id, "SUCCEEDED", true] call BIS_fnc_taskSetState;
								call _callbackCompleted;
								["BRM_FMK_taskStateChanged", [_sideChar, _id, "SUCCEEDED"]] call CBA_fnc_localEvent;
							} else {
								if (_priority == PRIORITY_PRIMARY || _priority == PRIORITY_SECONDARY) then {
									_remainingPrimarySecondary = _remainingPrimarySecondary + 1
								};
							};
						};
					};
				};
			} forEach _x;

			if !(mission_running) exitWith {};

			private _endDelayed = _endDelayeds select _forEachIndex;
			if (_remainingPrimarySecondary == 0) then {
				if (_endDelayed) then {
					if ((missionNamespace getVariable format ["side_%1_side", _sideChar]) in mission_require_extraction) then {
						missionNamespace getVariable format ["brm_fmk_extraction_%1", _sideChar] params ["_extractionObjects", "_extractionTargets"];

						if (count _extractionTargets > 0) then {
							[
								missionNamespace getVariable format ["side_%1_side", _sideChar], format ["%1Extract", _sideChar],
								["Extract", "Make your way to an extraction zone.", "exit", []],
								["true", format ["!(side_%1_side in mission_require_extraction)", _sideChar]], PRIORITY_PRIMARY,
								["if (mission_extraction_enable_music) then {[selectRandom mission_extraction_tracks] call BRM_FMK_fnc_playGlobal}", "", ""]
							] spawn BRM_FMK_fnc_newTask;

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
				} else {
					_endDelayeds set [_forEachIndex, true];
				};
			} else {
				if (_endDelayed) then {
					_endDelayeds set [_forEachIndex, false];
				};
			};
		};
	} forEach BRM_FMK_tasks;

	sleep 3;
};
