#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "OCAP Plugin";
		authors[] = { "MrGoodson", "Nife" };
		description = "Plugin to initialize all OCAP functions.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	ocap_plugin = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class Functions {
			file = "\broma_framework\plugins\ocap_plugin\functions";

			CFGFNC(init);
		};
	};
};
