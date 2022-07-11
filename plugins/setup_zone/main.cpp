#ifdef BRM_PLUGIN_META
	class setup_zone {
		name = "Setup zone";
		version = 1;
		authors[] = {"Nife"};
		description = "Whenever a TvT mission is starting, players are forced to wait a set amount of time before being able to leave their start zones.";
		postInit[] = {"BRM_FMK_SetupZone_fnc_postInit"};
	};
#endif

#ifdef BRM_PARAMS_TIME
	#include "Parameters.cpp"
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif
