#ifdef BRM_PARAMS_TIME
	#ifndef SETUPZONE_PARAM_TIME
	#define SETUPZONE_PARAM_TIME 15
	#endif

	class p_setup_time {
		title = "Setup time";
		values[] = {         15,         60,         180,         300,          600};
		texts[] = {"15 seconds", "1 minute", "3 minutes", "5 minutes", "10 minutes"};
		default = SETUPZONE_PARAM_TIME;
	};
#endif
