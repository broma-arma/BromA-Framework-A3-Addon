#include "script_component.hpp"
if (!isServer) exitWith {};

0 spawn {
    sleep ([] call FUNC(getSettings) select 2);
    setupZoneEnd = true;
    publicVariable "setupZoneEnd";
};

[] call FUNC(resetRoundVariables);
[] call FUNC(roundStartMission);

round_over = false;

sleep 5;

[side_a_side] spawn FUNC(CasualtiesCapCheck);
[side_b_side] spawn FUNC(CasualtiesCapCheck);
if (mission_enable_side_c) then {
    [side_c_side] spawn FUNC(CasualtiesCapCheck);
};

[] spawn FUNC(checkRoundEnd);
