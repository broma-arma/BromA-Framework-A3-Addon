#ifdef BRM_PLUGIN_META
	class acre2_plugin {
		name = "ACRE2 Plugin";
		version = 1;
		authors[] = {"Nife"};
		description = "Sets up environment variables and functions necessary to work with the Advanced Combat Radio Environment 2 radio system.";
		postInit[] = {"BRM_FMK_ACRE2_fnc_postInit"};
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif
