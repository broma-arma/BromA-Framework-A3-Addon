#ifdef BRM_PLUGIN_META
	class spawn_ai {
		name = "AI Spawner";
		version = 0.3;
		authors[] = {"Nife"};
		description = "This plugin has several handy functions in order to spawn AI units to perform several tasks.";
		postInit[] = {"BRM_FMK_SpawnAI_fnc_postInit"};
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif
