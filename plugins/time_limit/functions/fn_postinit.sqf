if (!isServer) exitWith {};

private _timeLimit = ["p_time_limit", -1] call BIS_fnc_getParamValue;

if (_timeLimit == -1) exitWith {};

private _alertTimes = [] call BRM_FMK_TimeLimit_fnc_getSettings select 0;

BRM_FMK_TimeLimit_countdown = _timeLimit;

0 spawn {
	while {BRM_FMK_TimeLimit_countdown > 0} do {
		if (BRM_FMK_TimeLimit_countdown <= 10 || {BRM_FMK_TimeLimit_countdown in _alertTimes}) then {
			private _time = BRM_FMK_TimeLimit_countdown;
			private _timeUnit = if (_time >= 60) then {
				_time = floor (_time / 60);

				"minute"
			} else {
				"second"
			};
			if (_time != 1) then {
				_timeUnit = _timeUnit + "s";
			};

			if (BRM_FMK_TimeLimit_countdown <= 10) then {
				["CLIENTS", "HINT", format ["%1 %2 remaining in the mission!", _time, _timeUnit]] call BRM_FMK_fnc_doLog;
			} else {
				["Timer", [format ["%1 %2 remaining in the mission!", _time, _timeUnit]]] remoteExec ["BIS_fnc_showNotification", [0, -2] select isDedicated];
			};
		};

		sleep 1;
		BRM_FMK_TimeLimit_countdown = BRM_FMK_TimeLimit_countdown - 1;
	};

	["Timer", ["Time's up!"]] remoteExec ["BIS_fnc_showNotification", [0, -2] select isDedicated];

	if (mission_game_mode == "coop") then {
		["defeat"] call BRM_FMK_fnc_callEnding;
	} else {
		["tvt_end"] call BRM_FMK_fnc_callEnding;
	};
};
