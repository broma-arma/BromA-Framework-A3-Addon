#ifdef BRM_PARAMS_TIME
	#ifndef CIVCASCAP_PARAM_LIMIT
	#define CIVCASCAP_PARAM_LIMIT -1
	#endif

	class p_dead_civies {
		title = "Civilian death limit";
		values[] = {       -1,   1,   2,   3,   4,   5,   15,   30,   50,   100};
		texts[] = {"Disabled", "1", "2", "3", "4", "5", "15", "30", "50", "100"};
		default = CIVCASCAP_PARAM_LIMIT;
	};
#endif
