#ifdef BRM_PLUGIN_META
	class f_casualties_cap {
		name = "Casualty cap";
		version = 1;
		authors[] = {"Coryf88"};
		description = "Ends the mission after a certain parameter determined percentage of mission set groups have died.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif
