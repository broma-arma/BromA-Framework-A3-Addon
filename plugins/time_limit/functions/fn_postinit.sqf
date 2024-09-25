if (!isServer) exitWith {};

private _timeLimit = ["p_time_limit", -1] call BIS_fnc_getParamValue; // -1="No limit", 10800="3 hours", 7200="2 hours", 3600="1 hour", 2700="45 minutes", 1800="30 minutes", 900="15 minutes", 600="10 minutes", 65="1 minute"
if (_timeLimit == -1) exitWith {};

// Time added per objective
BrmFmk_TimeLimit_timeAdd = (["p_time_added", 0] call BIS_fnc_getParamValue) * 60; // 0="Disabled", 5="5 minutes", 15="15 minutes", 30="30 minutes", 60="1 hour"

if (isNil "time_alerted_minutes") then { time_alerted_minutes = [120, 60, 15, 1] };

time_alerted_minutes = time_alerted_minutes apply { _x * 60 };

BrmFmk_TimeLimit_countdown = _timeLimit;

["BRM_FMK_taskStateChanged", {
	params ["_sideChar", "_id", "_state"];
	if (_state == "SUCCEEDED") then {
		[BrmFmk_TimeLimit_timeAdd] call BRM_FMK_TimeLimit_fnc_addTime;
	}
}] call CBA_fnc_addEventHandler;

0 spawn {
	while {BrmFmk_TimeLimit_countdown > 0} do {
		if (BrmFmk_TimeLimit_countdown <= 10 || {BrmFmk_TimeLimit_countdown in time_alerted_minutes}) then {
			private _time = BrmFmk_TimeLimit_countdown;
			private _timeUnit = "second";
			if (_time >= 60) then {
				_time = floor (_time / 60);
				_timeUnit = "minute";
			};
			if (_time != 1) then {
				_timeUnit = _timeUnit + "s";
			};

			if (BrmFmk_TimeLimit_countdown <= 10) then {
				["CLIENTS", "HINT", format ["%1 %2 remaining in the mission!", _time, _timeUnit]] call BRM_FMK_fnc_doLog;
			} else {
				["Timer", [format ["%1 %2 remaining in the mission!", _time, _timeUnit]]] remoteExec ["BIS_fnc_showNotification", [0, -2] select isDedicated];
			};
		};

		sleep 1;
		BrmFmk_TimeLimit_countdown = BrmFmk_TimeLimit_countdown - 1;
	};

	["Timer", ["Time's up!"]] remoteExec ["BIS_fnc_showNotification", [0, -2] select isDedicated];

	if (mission_game_mode == "coop") then {
		["defeat"] call BRM_FMK_fnc_endMission;
	} else {
		["tvt_end"] call BRM_FMK_fnc_endMission;
	};
};
