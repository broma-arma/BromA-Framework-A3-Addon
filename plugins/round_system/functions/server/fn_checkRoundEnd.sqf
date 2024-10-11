if (!isServer) exitWith {};

mission_countdown = BRM_FMK_Plugin_RoundSystem_timeLimit;

["LOCAL", "CHAT", "Initializing round condition check...", BRM_FMK_Plugin_RoundSystem_debug] call BRM_FMK_fnc_doLog;

waitUntil {
	if (mission_countdown > 0) then {
		mission_countdown = (mission_countdown - 1);
		mission_countdown_minutes = floor (mission_countdown / 60);

		if (mission_countdown in BRM_FMK_Plugin_RoundSystem_remainderAlert) then {
			["CLIENTS", "HINT", format ["%1 minutes remaining in the round!", mission_countdown_minutes]] call BRM_FMK_fnc_doLog;
		};

		if (mission_countdown <= 10) then {
			["CLIENTS", "HINT", format ["%1 seconds remaining in the round!", mission_countdown]] call BRM_FMK_fnc_doLog;
		};
	};

	sleep 1;

	(mission_countdown == 0) ||
	(count round_dead_sides == (match_sides - 1)) ||
	call BRM_FMK_Plugin_RoundSystem_victoryA ||
	call BRM_FMK_Plugin_RoundSystem_victoryB ||
	call BRM_FMK_Plugin_RoundSystem_victoryC ||
	(round_over)
};

switch (true) do {
	case (mission_countdown == 0): { round_end_reason = "TIME" };
	case ((count round_dead_sides == (match_sides - 1))): { round_end_reason = "DEATH" };
	case ((call BRM_FMK_Plugin_RoundSystem_victoryA) ||
		  (call BRM_FMK_Plugin_RoundSystem_victoryB) ||
		  (call BRM_FMK_Plugin_RoundSystem_victoryC)): { round_end_reason = "OBJECTIVE" };
};

["LOCAL", "CHAT", "Ending round condition check...", BRM_FMK_Plugin_RoundSystem_debug] call BRM_FMK_fnc_doLog;

[] call BRM_FMK_Plugin_RoundSystem_fnc_roundEnd;
