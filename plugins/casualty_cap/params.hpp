#ifdef BRM_PARAMS_TIME
	#ifndef CASCAP_PARAM_LIMIT
	#define CASCAP_PARAM_LIMIT -1
	#endif

	class p_cas_cap {
		title = "Casualty Cap";
		values[] = {       -1,    80,    90,    95,    100};
		texts[] = {"Disabled", "80%", "90%", "95%", "100%"};
		default = CASCAP_PARAM_LIMIT;
	};
#endif
