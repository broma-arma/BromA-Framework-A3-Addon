BRM_round_system_rounds_needed = ["p_round_params", 3] call BIS_fnc_getParamValue; // 1="1", 2="2", 3="3", 4="4", 5="5"

BRM_round_system_time_limit = ["p_round_time_limit", 15] call BIS_fnc_getParamValue; // 1="1 minute", 5="5 minutes", 15="15 minutes", 30="30 minutes", 60="1 hour", 99999999="No limit"
BRM_round_system_time_limit = (BRM_round_system_time_limit * 60);
