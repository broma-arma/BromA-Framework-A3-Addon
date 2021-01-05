#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "AGM Plugin";
		authors[] = { "Nife" };
		description = "Based on parameters and mission settings, configures whatever desired AGM modules, including Medical and respawning system.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	agm_plugin = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\agm_plugin\functions";

			CFGFNC(setParams);
			CFGFNC(postinit);
		};
	};
};
