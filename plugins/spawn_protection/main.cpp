#ifdef BRM_PLUGIN_META
	class spawn_protection {
		name = "Spawn protection";
		version = 1;
		authors[] = {"Nife", "Coryf88"};
		description = "Creates a protection zone around the insertion point, which can last forever or as long as the mission parameters determine, ensuring neither players or friendly vehicles can take damage while inside.";
		postInit[] = {"BRM_FMK_SpawnProtection_fnc_postInit"};
	};
#endif

#ifdef BRM_PARAMS_TIME
	#include "Parameters.cpp"
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif
