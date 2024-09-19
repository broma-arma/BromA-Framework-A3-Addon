// Time limit parameter
mission_time_limit = ["p_time_limit", -1] call BIS_fnc_getParamValue; // -1="No limit", 10800="3 hours", 7200="2 hours", 3600="1 hour", 2700="45 minutes", 1800="30 minutes", 900="15 minutes", 600="10 minutes", 65="1 minute"
//-1="No limit", 60="1 minute", 300="5 minutes", 600="10 minutes", 900="15 minutes", 1800="30 minutes", 2700="45 minutes", 3600="1 hour", 7200="2 hours", 10800="3 hours"

// Time added per objective parameter
mission_time_added = (["p_time_added", 0] call BIS_fnc_getParamValue) * 60; // 0="Disabled", 5="5 minutes", 15="15 minutes", 30="30 minutes", 60="1 hour"
//0="Disabled", 1="1 minute", 5="5 minutes", 10="10 minutes", 15="15 minutes", 30="30 minutes", 45="45 minutes", 60="1 hour"
