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

if (!isServer) exitWith {};

if (isNil "BRM_FMK_tasks") then { BRM_FMK_tasks = [[], [], []]; };

while { mission_running } do {
	{
		if (count _x > 0) then {
			private _sideChar = ["a", "b", "c"] select _forEachIndex;

			private _remainingPrimary = 0;
			{
				_x params ["_id", "_priority", "_condWin", "_condLose", "_cbCompleted", "_cbFailed"];

				private _taskState = [_id] call BIS_fnc_taskState;
				if (_taskState != "FAILED" && _taskState != "CANCELED" && {call _condLose}) then {
					if (_priority != 1) then {
						[_id, "FAILED", true] call BIS_fnc_taskSetState;
						call _cbFailed;
						if (_priority == 2) then {
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
						call _cbFailed;
					};
				} else {
					if (_taskState != "SUCCEEDED" && _taskState != "FAILED" && _taskState != "CANCELED") then {
						if (call _condWin) then {
							[_id, "SUCCEEDED", true] call BIS_fnc_taskSetState;
							call _cbCompleted;

							if ("respawn_system" in usedPlugins) then {
								[missionNamespace getVariable format ["side_%1_side", _sideChar], mission_respawn_objective] spawn BRM_FMK_RespawnSystem_fnc_callRespawnSide;
							};

							if ("time_limit" in usedPlugins) then {
								[mission_time_added] call BRM_FMK_TimeLimit_fnc_addTime;
							};
						} else {
							if (_priority == 2) then {
								_remainingPrimary = _remainingPrimary + 1
							};
						};
					};
				};
			} forEach _x;

			if (mission_running && _remainingPrimary == 0) then {
				if ("f_evade_escape" in usedPlugins && (missionNamespace getVariable format ["side_%1_side", _sideChar]) in mission_require_extraction) then {
					[
						missionNamespace getVariable format ["side_%1_side", _sideChar], format ["%1Extract", _sideChar],
						["Extract", "Make your way to an extraction zone.", "exit", []],
						["true", format ["!(side_%1_side in mission_require_extraction)", _sideChar]], 2,
						["if (mission_extraction_enable_music) then {[selectRandom mission_extraction_tracks] call BRM_FMK_fnc_playGlobal}", "", ""]
					] spawn BRM_FMK_fnc_newTask;

					private _extraction = missionNamespace getVariable format ["extraction_%1", _sideChar];
					[_extraction select 0, _extraction select 1, 100, format ["mission_require_extraction = mission_require_extraction - [side_%1_side];", _sideChar]] spawn BRM_FMK_f_evade_escape_fnc_reachObject;
				} else {
					if (mission_game_mode != "coop") then {
						[missionNamespace getVariable format ["endings_tvt_side_%1_victory", _sideChar]] call BRM_FMK_fnc_callEnding;
					} else {
						if (_sideChar == "a") then {
							[endings_victory] call BRM_FMK_fnc_callEnding;
						};
					};
				};
			};
		};
	} forEach BRM_FMK_tasks;

	sleep 3;
};
