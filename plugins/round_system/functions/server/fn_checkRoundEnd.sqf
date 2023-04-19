#include "script_component.hpp"
if (!isServer) exitWith {};

mission_countdown = BRM_round_system_time_limit;

["LOCAL", "CHAT", "Initializing round condition check...", ROUND_SYSTEM_DEBUG] call FUNCMAIN(doLog);

[] call FUNC(getSettings) select 7 params ["_victoryConditionA", "_victoryConditionB", "_victoryConditionC"];

waitUntil {
	if (mission_countdown > 0) then {
		mission_countdown = (mission_countdown - 1);
	};

    if (mission_countdown > 0) then {
		if (mission_countdown in ([] call FUNC(getSettings) select 3)) then {
			["CLIENTS", "HINT", format ["%1 minutes remaining in the round!", floor (mission_countdown / 60)]] call FUNCMAIN(doLog);
		};

		if (mission_countdown <= 10) then {
			["CLIENTS", "HINT", format ["%1 seconds remaining in the round!", mission_countdown]] call FUNCMAIN(doLog);
		};
    };

    sleep 1;

    (mission_countdown == 0) ||
    (count round_dead_sides == (match_sides - 1)) ||
    call _victoryConditionA ||
    call _victoryConditionB ||
    call _victoryConditionC ||
    (round_over)
};

switch (true) do {
    case (mission_countdown == 0): { round_end_reason = "TIME" };
    case ((count round_dead_sides == (match_sides - 1))): { round_end_reason = "DEATH" };
    case ((call _victoryConditionA) ||
          (call _victoryConditionB) ||
          (call _victoryConditionC)): { round_end_reason = "OBJECTIVE" };
};

["LOCAL", "CHAT", "Ending round condition check...", ROUND_SYSTEM_DEBUG] call FUNCMAIN(doLog);

[] call FUNC(roundEnd);
