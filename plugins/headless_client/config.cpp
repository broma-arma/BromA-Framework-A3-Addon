#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "Headless Client";
		authors[] = { "Naught", "Nife" };
		description = "Suite of functions made to facilitate the usage of the Headless Client and its environment variables.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	headless_client = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\headless_client\functions";

			CFGFNC(setParams);
			CFGFNC(postinit);
		};
	};
};
