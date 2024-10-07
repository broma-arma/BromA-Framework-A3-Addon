#ifdef BRM_PARAMS_TIME
	#ifndef SETUPZONE_PARAM_TIME
	#define SETUPZONE_PARAM_TIME 0
	#endif

	class p_setup_time {
		title = "Setup time";
		values[] = {          0,          1,           2,           3,            4};
		texts[] = {"15 seconds", "1 minute", "3 minutes", "5 minutes", "10 minutes"};
		default = SETUPZONE_PARAM_TIME;
	};
#endif
