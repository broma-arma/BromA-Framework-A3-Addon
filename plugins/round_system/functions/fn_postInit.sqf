// =============================================================================
//  Amount of rounds needed to win
// =============================================================================
BRM_round_system_rounds_needed = ["p_round_params", 3] call BIS_fnc_getParamValue;

// =============================================================================
//  Time Limit per round
// =============================================================================
BRM_round_system_time_limit = ["p_round_time_limit", 15] call BIS_fnc_getParamValue;
BRM_round_system_time_limit = (BRM_round_system_time_limit * 60);

// =============================================================================
