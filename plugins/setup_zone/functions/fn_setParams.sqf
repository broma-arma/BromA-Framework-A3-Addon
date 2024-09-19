// 0="15 seconds", 1="1 minute", 2="3 minutes", 3="5 minutes", 4="10 minutes"
mission_setup_time = [15, 60, 180, 300, 600] select (["p_setup_time", 0] call BIS_fnc_getParamValue);
