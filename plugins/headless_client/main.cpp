#ifdef BRM_PLUGIN_META
	class headless_client {
		name = "Headless Client";
		version = 1;
		authors[] = {"Nife", "Coryf88"};
		description = "Suite of functions made to facilitate the usage of the Headless Client and its environment variables.";
		postInit[] = {"BRM_FMK_HC_fnc_postInit"};
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif
