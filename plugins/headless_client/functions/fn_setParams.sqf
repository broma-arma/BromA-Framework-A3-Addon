switch (["p_enable_hc", 0] call BIS_fnc_getParamValue) do { // 0="Disabled", 1="Enabled"
	case 0: { mission_enable_hc = false };
	case 1: { mission_enable_hc = true };
};
