#ifdef BRM_PLUGIN_META
	class ao_limit {
		name = "AO Limit";
		version = 1;
		authors[] = {"Nife"};
		description = "Displays a message (or anything nastier) to players who leave the designated Area of Operations.";
		postInit[] = {"BRM_FMK_AOLimit_fnc_postInit"};
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif
