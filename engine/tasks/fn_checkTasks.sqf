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

//                              Win? Lose?
#define PRIORITY_SECONDARY 0 // No   Yes
#define PRIORITY_OPTIONAL 1  // No   No
#define PRIORITY_PRIMARY 2   // Yes  Yes

if (!isServer) exitWith {};

if (isNil "BRM_FMK_tasks") then { BRM_FMK_tasks = [[], [], []]; };

private _endDelayeds = [false, false, false];

while { mission_running } do {
	{
		if !(mission_running) exitWith {};

		if (count _x > 0) then {
			private _sideChar = ["a", "b", "c"] select _forEachIndex;

			private _remainingPrimary = 0;
			{
				_x params ["_id", "_priority", "_predicateWin", "_predicateLose", "_callbackCompleted", "_callbackFailed"];

				private _taskState = [_id] call BIS_fnc_taskState;
				if (_taskState != "FAILED" && _taskState != "CANCELED" && {call _predicateLose}) then {
					if (_priority != PRIORITY_OPTIONAL) then {
						[_id, "FAILED", true] call BIS_fnc_taskSetState;
						call _callbackFailed;
						if (_priority == PRIORITY_PRIMARY) then {
							if (mission_game_mode != "coop") then {
								[missionNamespace getVariable format ["endings_tvt_side_%1_defeat", _sideChar]] call BRM_FMK_fnc_callEnding;
							} else {
								if (_sideChar == "a") then {
									[endings_defeat] call BRM_FMK_fnc_callEnding;
								};
							};
						};
					} else {
						[_id, "CANCELED", true] call BIS_fnc_taskSetState;
						call _callbackFailed;
					};
				} else {
					if (_taskState != "SUCCEEDED" && _taskState != "FAILED" && _taskState != "CANCELED") then {
						if (call _predicateWin) then {
							[_id, "SUCCEEDED", true] call BIS_fnc_taskSetState;
							call _callbackCompleted;

							if ("respawn_system" in usedPlugins) then {
								[missionNamespace getVariable format ["side_%1_side", _sideChar], mission_respawn_objective] call BRM_FMK_RespawnSystem_fnc_callRespawnSide;
							};

							if ("time_limit" in usedPlugins) then {
								[mission_time_added] call BRM_FMK_TimeLimit_fnc_addTime;
							};
						} else {
							if (_priority == PRIORITY_PRIMARY) then {
								_remainingPrimary = _remainingPrimary + 1
							};
						};
					};
				};
			} forEach _x;

			if !(mission_running) exitWith {};

			private _endDelayed = _endDelayeds select _forEachIndex;
			if (_remainingPrimary == 0) then {
				if (_endDelayed) then {
					if ((missionNamespace getVariable format ["side_%1_side", _sideChar]) in mission_require_extraction) then {
						missionNamespace getVariable format ["brm_fmk_extraction_%1", _sideChar] params ["_extractionObjects", "_extractionTargets"];

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
						if (mission_game_mode != "coop") then {
							[missionNamespace getVariable format ["endings_tvt_side_%1_victory", _sideChar]] call BRM_FMK_fnc_callEnding;
						} else {
							if (_sideChar == "a") then {
								[endings_victory] call BRM_FMK_fnc_callEnding;
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
