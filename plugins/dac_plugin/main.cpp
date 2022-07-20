#ifdef BRM_PLUGIN_META
	class dac_plugin {
		name = "DAC Plugin";
		version = 1;
		authors[] = {"Nife"};
		description = "Adds easier and simpler ways to configure and create DAC zones, with focus on verbosity and lack of long strings of numbers - also compatible with Headless Client.";
		preInit[] = {"BRM_FMK_DAC_fnc_preInit"};
		postInit[] = {"BRM_FMK_DAC_fnc_postInit"};
	};
#endif

#ifdef BRM_PARAMS_AI
	#include "Parameters.cpp"
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif
