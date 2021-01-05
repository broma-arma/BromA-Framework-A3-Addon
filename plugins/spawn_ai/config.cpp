#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "AI Spawner";
		authors[] = { "Nife" };
		description = "This plugin has several handy functions in order to spawn AI units to perform several tasks.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	spawn_ai = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\spawn_ai\functions";

			CFGFNC(postInit);
		};

		class Functions {
			file = "\broma_framework\plugins\spawn_ai\functions";

			CFGFNC(infantry);
			CFGFNC(spawnUnit);
			CFGFNC(addDistance);
			CFGFNC(cacheUnits);
		};
	};
};
