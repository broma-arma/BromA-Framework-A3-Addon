#ifdef BRM_PLUGIN_META
	class ai_spawner {
		name = "AI Spawner";
		version = 0.1;
		authors[] = {"Royal"};
		description = "Spawn AI.";
		postInit[] = {"BRM_FMK_AIS_fnc_postInit"};
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif
