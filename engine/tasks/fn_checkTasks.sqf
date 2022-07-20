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

if (isNil "BRM_FMK_tasks") then { BRM_FMK_tasks = []; };

private _delayed = false;
private _sideDelayed = [false, false, false];
private _sideWin = ["", "", ""];
while { mission_running } do {
	private _sideTasks = [0, 0, 0];
	private _sideUncreatedTasks = [0, 0, 0];

	{
		if (!mission_running) exitWith {};

		_x params [
			"_taskID", "_sides", "_owners", "_id", "_title", "_description", "_type", "_position",
			"_missionComplete", "_missionFail", "_endingComplete", "_endingFail",
			"_predicateAssign", "_predicateComplete", "_predicateFail",
			"_callbackAssigned", "_callbackCompleted", "_callbackFailed",
			["_created", false]
		];

		if (!_created && { call _predicateAssign }) then {
			_created = true;
			_x set [18, _created];
			private _dynamicTaskMarker = nil;
			if (_position isEqualType [] && { count _position == 2 && { _position select 0 isEqualType objNull && (_position select 1 isEqualType 0 || _position select 1 isEqualType []) } }) then {
				_position params ["_obj", "_delay"];

				if (_delay isEqualType 0) then { _delay = [_delay, _delay]; };
				_delay params ["_minDelay", "_maxDelay"];
				if (_minDelay > 0 && _maxDelay > 0) then {
					_position = _obj getRelPos [random (([_minDelay, _maxDelay] call BIS_fnc_randomNum) * (random 50 + 50)), random 360];
					_dynamicTaskMarker = [_id, _obj, [_minDelay, _maxDelay]];
				};
			};
			[_owners, _id, [_description, _title, ""], _position, false, 0, time > 1, _type, true] call BIS_fnc_taskCreate;
			if (!isNil "_dynamicTaskMarker") then {
				_dynamicTaskMarker call BRM_FMK_fnc_updateTaskMarker;
			};
			call _callbackAssigned;
		};

		if (_created) then {
			{
				private _side = missionNamespace getVariable format ["side_%1_side", _x];
				if (_side in _sides) then {
					_sideTasks set [_forEachIndex, _sideTasks # _forEachIndex + 1];
				};
			} forEach ["a", "b", "c"];

			private _taskState = _id call BIS_fnc_taskState;
			if (_taskState != "FAILED" && _taskState != "CANCELED") then {
				if (call _predicateFail) then {
					[_id, "FAILED", true] call BIS_fnc_taskSetState;
					call _callbackFailed;
					if (_missionFail) then {
						[_endingFail] call BRM_FMK_fnc_callEnding;
					};
				} else {
					if (_taskState != "SUCCEEDED") then {
						if (call _predicateComplete) then {
							[_id, "SUCCEEDED", true] call BIS_fnc_taskSetState;
							call _callbackCompleted;

							if ("respawn_system" in BRM_plugins) then {
								{
									[_x, mission_respawn_objective] call BRM_FMK_RespawnSystem_fnc_callRespawnSide;
								} forEach _sides;
							};

							if ("time_limit" in BRM_plugins) then {
								[(["p_time_added", 0] call BIS_fnc_getParamValue) * 60] call BRM_FMK_TimeLimit_fnc_addTime;
							};

							{
								private _side = missionNamespace getVariable format ["side_%1_side", _x];
								if (_side in _sides) then {
									_sideWin set [_forEachIndex, _endingComplete];
								};
							} forEach ["a", "b", "c"];
						} else {
							if (_missionComplete) then {
								{
									private _side = missionNamespace getVariable format ["side_%1_side", _x];
									if (_side in _sides) then {
										_sideWinTasks set [_forEachIndex, _sideWinTasks # _forEachIndex + 1];
									};
								} forEach ["a", "b", "c"];
							};
						};
					};
				};
			};
		} else {
			{
				private _side = missionNamespace getVariable format ["side_%1_side", _x];
				if (_side in _sides) then {
					_sideUncreatedTasks set [_forEachIndex, _sideUncreatedTasks # _forEachIndex + 1];
				};
			} forEach ["a", "b", "c"];
		};
	} forEach BRM_FMK_tasks;

	if (!mission_running) exitWith {};

	private _winners = [];
	for "_i" from 0 to 2 do {
		if (_sideTasks select _i > 0 && _sideWinTasks select _i == 0) then {
			_winners pushBack _i;
		};

		if (_sideUncreatedTasks select _i == 0) then {
			_sideDelayed set [_i, true];
		};
	};

	if (count _winners > 0) then {
		if (_winners apply { _sideDelayed select _x } findIf { !_x } == -1) then {
			{
				private _sideChar = ["a", "b", "c"] select _x;
				if !((missionNamespace getVariable format ["side_%1_side", _sideChar]) in mission_require_extraction) exitWith {
					[_sideWin select _x] call BRM_FMK_fnc_callEnding;
				};

				missionNamespace getVariable format ["brm_fmk_extraction_%1", _sideChar] params ["_extractionObjects", "_extractionTargets"];

				if (count _extractionTargets > 0) then {
					[
						missionNamespace getVariable format ["side_%1_side", _sideChar], format ["BRM_FMK_Extract%1", _sideChar],
						"Extract", "Make your way to an extraction zone.", "exit", [], true, true,
						[{true}, compile format ["!(side_%1_side in mission_require_extraction)", _sideChar]],
						[{if (mission_extraction_enable_music) then { [selectRandom mission_extraction_tracks] call BRM_FMK_fnc_playGlobal; }}]
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
			} forEach _winners;
		} else {
			_delayed = true;
			{
				_sideDelayed set [_x, true];
			} forEach _winners;
		};
	} else {
		if (_delayed) then {
			for "_i" from 0 to 2 do {
				_sideDelayed set [_i, false];
			};
			_delayed = false;
		};
	};

	if (mission_running) then {
		sleep 3;
	};
};
