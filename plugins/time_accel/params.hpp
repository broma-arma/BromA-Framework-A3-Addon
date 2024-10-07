#ifdef BRM_PARAMS_TIME
	#ifndef TIMEACCEL_PARAM_ACCELERATION
	#define TIMEACCEL_PARAM_ACCELERATION 1
	#endif

	class p_time_accel {
		title = "Time acceleration";
		values[] = {  0,    1,    2,    5,    10,    100};
		texts[] = {"0x", "1x", "2x", "5x", "10x", "100x"};
		default = TIMEACCEL_PARAM_ACCELERATION;
	};
#endif
