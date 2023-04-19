#ifdef BRM_PARAMS_TIME
	#define ACCELERATION 1

	#if __has_include("settings\plugins\time_accel.sqf")
	#include "settings\plugins\time_accel.sqf"
	#endif

	class p_time_accel {
		title = "Time acceleration";
		values[] = {0,    1,    2,    5,    10,    100};
		texts[] = { "0x", "1x", "2x", "5x", "10x", "100x"};
		default = ACCELERATION;
	};

	#undef ACCELERATION
#endif
