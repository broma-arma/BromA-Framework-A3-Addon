#ifdef BRM_PLUGIN_META
	class mission_conditions
	{
		name = "Mission Conditions";
		version = 1;
		authors[] = {"Nife"};
		description = "Sets the mission conditions such as weather and time.";
		postInit[] = {"BRM_FMK_MissionConditions_fnc_postInit"};
	};
#endif

#ifdef BRM_PARAMS_CONDITIONS
	#include "Parameters.cpp"
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif
