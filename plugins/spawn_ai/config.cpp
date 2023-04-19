#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\spawn_ai\functions";
			CFGFNC(postInit);
		};
		class Functions {
			file = "\broma_framework\plugins\spawn_ai\functions";
			CFGFNC(getSettings);
			CFGFNC(infantry);
			CFGFNC(spawnUnit);
			CFGFNC(addDistance);
			CFGFNC(cacheUnits);
		};
	};
};

class BRM_FMK_Plugins {
	class spawn_ai {
		name = "AI Spawner";
		version = 0.3;
		authors[] = {"Nife"};
		description = "This plugin has several handy functions in order to spawn AI units to perform several tasks.";
		postInit[] = {QFUNC(postInit)};
	};
};
