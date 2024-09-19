if (!isServer) exitWith {};

round_over = true;

round_winner_text = [] call BRM_FMK_Plugin_RoundSystem_fnc_roundHandleResults;
publicVariable "round_winner_text";

sleep 5;

if (count match_ending_winner > 0) then {

	mission_dead_side_A = cache_deaths_a;
	mission_dead_side_B = cache_deaths_b;
	mission_dead_side_C = cache_deaths_c;

	[match_ending_winner select 0] call BRM_FMK_fnc_callEnding;

} else {
	match_current_round = match_current_round + 1;
	publicVariable "match_current_round";

	[] call BRM_FMK_Plugin_RoundSystem_fnc_resetRoundVariables;

	mission_dead_players = [];
	[round_winner_text, {
		[] call BRM_FMK_Plugin_RoundSystem_fnc_roundEndPlayer;
		(_this) call BRM_FMK_Plugin_RoundSystem_fnc_displayWinner;
	}] remoteExec ["call", -2];

	{ deleteVehicle _x } count (allDead);

	[] spawn BRM_FMK_Plugin_RoundSystem_fnc_roundStart;
	[] remoteExecCall ["BRM_FMK_Plugin_RoundSystem_fnc_roundStartPlayer", -2];

	[] call BRM_FMK_Round_System_fnc_roundEndMission;

	["LOCAL", "CHAT", "Waiting to begin new round...", ROUND_SYSTEM_DEBUG] call BRM_FMK_fnc_doLog;

	sleep round_seconds_between;
};
