#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "ACRE2 Plugin";
		authors[] = { "Nife" };
		description = "Sets up environment variables and functions necessary to work with the Advanced Combat Radio Environment 2 radio system.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	acre2_plugin = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\acre2_plugin\functions";

			CFGFNC(postInit);
		};
	};
};
