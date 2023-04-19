#include "script_component.hpp"
if (!isServer) exitWith {};

round_over = true;

round_winner_text = [] call FUNC(roundHandleResults);
publicVariable "round_winner_text";

sleep 5;

if (count match_ending_winner > 0) then {

    mission_dead_side_A = cache_deaths_a;
    mission_dead_side_B = cache_deaths_b;
    mission_dead_side_C = cache_deaths_c;

    [match_ending_winner select 0] call FUNCMAIN(callEnding);

} else {
    match_current_round = match_current_round + 1;
    publicVariable "match_current_round";

    [] call FUNC(resetRoundVariables);

	mission_dead_players = [];
    [round_winner_text, {
        [] call FUNC(roundEndPlayer);
        (_this) call FUNC(displayWinner);
    }] remoteExec ["call", -2];

    { deleteVehicle _x } count (allDead);

    [] spawn FUNC(roundStart);
    [] remoteExecCall [QFUNC(roundStartPlayer), -2];

    [] call FUNC(roundEndMission);

    ["LOCAL", "CHAT", "Waiting to begin new round...", ROUND_SYSTEM_DEBUG] call FUNCMAIN(doLog);

    sleep ([] call FUNC(getSettings) select 2);
};
