#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "TFAR Plugin";
		authors[] = { "Nife" };
		description = "Sets up environment variables and functions necessary to work with the Task Force Radio Alpha radio system.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	tfar_plugin = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\tfar_plugin\functions";

			CFGFNC(postInit);
			CFGFNC(autoSetupRadios);
		};
	};
};
