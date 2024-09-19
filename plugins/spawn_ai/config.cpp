class BRM_FMK {
	class Plugins {
		class spawn_ai {
			name = "AI Spawner";
			version = 0.3;
			authors[] = {"Nife"};
			description = "This plugin has several handy functions in order to spawn AI units to perform several tasks.";
			tag = "BRM_FMK_Plugin_SpawnAI";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_SpawnAI {
		class functions {
			file = "\broma_framework\plugins\spawn_ai\functions";
			class postInit {};
			class spawnUnit {};
			class cacheUnits {};
		};
	};
	class BRM_FMK_SpawnAI {
		class functions {
			file = "\broma_framework\plugins\spawn_ai\functions";
			class infantry {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_SpawnAI {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
