#include "script_component.hpp"
if (!isServer) exitWith {};

private _timeLimit = ["p_time_limit", -1] call BIS_fnc_getParamValue;

if (_timeLimit == -1) exitWith {};

private _alertTimes = [] call FUNC(getSettings) select 0;

GVAR(countdown) = _timeLimit;

0 spawn {
	while {GVAR(countdown) > 0} do {
		if (GVAR(countdown) <= 10 || {GVAR(countdown) in _alertTimes}) then {
			private _time = GVAR(countdown);
			private _timeUnit = if (_time >= 60) then {
				_time = floor (_time / 60);

				"minute"
			} else {
				"second"
			};
			if (_time != 1) then {
				_timeUnit = _timeUnit + "s";
			};

			if (GVAR(countdown) <= 10) then {
				["CLIENTS", "HINT", format ["%1 %2 remaining in the mission!", _time, _timeUnit]] call FUNCMAIN(doLog);
			} else {
				["Timer", [format ["%1 %2 remaining in the mission!", _time, _timeUnit]]] remoteExec ["BIS_fnc_showNotification", [0, -2] select isDedicated];
			};
		};

		sleep 1;
		GVAR(countdown) = GVAR(countdown) - 1;
	};

	["Timer", ["Time's up!"]] remoteExec ["BIS_fnc_showNotification", [0, -2] select isDedicated];

	if (mission_game_mode == "coop") then {
		["defeat"] call FUNCMAIN(callEnding);
	} else {
		["tvt_end"] call FUNCMAIN(callEnding);
	};
};
