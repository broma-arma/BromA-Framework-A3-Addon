if (!isServer) exitWith {};

waitUntil { !isNil "mission_time_limit" };

if (mission_time_limit == -1) exitWith {};

if (isNil "time_alerted_minutes") then { time_alerted_minutes = [120, 60, 15, 1] };

time_alerted_minutes = time_alerted_minutes apply { _x * 60 };

BrmFmk_TimeLimit_countdown = mission_time_limit;

0 spawn {
	while {BrmFmk_TimeLimit_countdown > 0} do {
		if (BrmFmk_TimeLimit_countdown <= 10 || {BrmFmk_TimeLimit_countdown in time_alerted_minutes}) then {
			private _time = BrmFmk_TimeLimit_countdown;
			private _timeUnit = if (_time >= 60) then {
				_time = floor (_time / 60);

				"minute"
			} else {
				"second"
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
		["defeat"] call BRM_fnc_callEnding;
	} else {
		["tvt_end"] call BRM_fnc_callEnding;
	};
};
