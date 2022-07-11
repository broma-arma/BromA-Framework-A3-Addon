#ifdef BRM_PLUGIN_META
	class round_system
	{
		name = "Round System";
		disabled = 1;
		version = 1;
		authors[] = {"Nife"};
		conflict_plugins[] = {"spawn_protection", "f_casualties_cap", "commander_lock"};
		description = "This plugin manages rounds for TvT/COTvT missions.";
		preInit[] = {"BRM_FMK_Round_System_fnc_preInit"};
		postInit[] = {"BRM_FMK_Round_System_fnc_postInit"};
	};
#endif

#ifdef BRM_PARAMS_TIME
	#include "Parameters.cpp"
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif
