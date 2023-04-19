#ifdef BRM_PARAMS_TIME
	#define LIMIT -1

	#if __has_include("settings\plugins\civilian_casualty_cap.sqf")
	#include "settings\plugins\civilian_casualty_cap.sqf"
	#endif

	class p_dead_civies {
		title = "Tolerance with civilian deaths";
		values[] = {-1,         5,     15,       30};
		texts[] = { "Disabled", "Low", "Medium", "High"};
		default = LIMIT;
	};

	#undef LIMIT
#endif
