#ifdef BRM_PARAMS_TIME
	#define LIMIT -1

	#if __has_include("settings\plugins\casualties_cap.sqf")
	#include "settings\plugins\casualties_cap.sqf"
	#endif

	class p_cas_cap {
		title = "Casualty Cap";
		values[] = {-1,         80,    90,    95,    100};
		texts[] = { "Disabled", "80%", "90%", "95%", "100%"};
		default = LIMIT;
	};

	#undef LIMIT
#endif
