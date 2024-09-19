#ifdef BRM_PLUGIN_META
	class spawn_ai {
		name = "AI Spawner";
		version = 0.3;
		authors[] = {"Nife"};
		description = "This plugin has several handy functions in order to spawn AI units to perform several tasks.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_SpawnAI {
	class functions {
		file = "\broma_framework\plugins\spawn_ai\functions";
		class postInit {};
		class infantry {};
		class spawnUnit {};
		class cacheUnits {};
	};
};
#endif
