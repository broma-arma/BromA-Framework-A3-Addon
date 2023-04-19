#ifdef BRM_PARAMS_TIME
	#define TIME -1

	#if __has_include("settings\plugins\spawn_protection.sqf")
	#include "settings\plugins\spawn_protection.sqf"
	#endif

	class p_spawn_protection_time {
		title = "Spawn protection duration";
		values[] = {0,          1,          15,           30,           -1};
		texts[] = { "Disabled", "1 minute", "15 minutes", "30 minutes", "Infinite"};
		default = TIME;
	};

	#undef TIME
#endif
