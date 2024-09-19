mission_allow_respawn = ["p_allow_respawn", 0] call BIS_fnc_getParamValue > 0; // 0="Disabled", 1="Enabled"
mission_player_lives = ["p_player_lives", 3] call BIS_fnc_getParamValue; // 1="1", 3="3", 5="5",1 10="10"
mission_respawn_objective = ["p_respawn_objective", 10] call BIS_fnc_getParamValue; // 0="0", 3="3", 5="5", 10="10", 99="Everyone"
