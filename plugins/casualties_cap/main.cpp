#ifdef BRM_PLUGIN_META
	class casualties_cap {
		name = "Casualty cap";
		version = 1;
		authors[] = {"Coryf88"};
		description = "Ends the mission after a certain parameter determined percentage of players have died.";
		postInit[] = {"BRM_FMK_casualties_cap_fnc_postInit"};
	};
#endif

#ifdef BRM_PARAMS_TIME
	#include "Parameters.cpp"
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif
