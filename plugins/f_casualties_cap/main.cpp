#ifdef BRM_PLUGIN_META
	class f_casualties_cap
	{
		name = "Casualty cap";
		version = 1;
		authors[] = {"Coryf88"};
		description = "Ends the mission after a certain parameter determined percentage of players have died.";
		postInit[] = {"BRM_FMK_f_cas_cap_fnc_postInit"};
	};
#endif

#ifdef BRM_PARAMS_TIME
	#include "Parameters.cpp"
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif
