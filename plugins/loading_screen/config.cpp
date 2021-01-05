#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "Loading screen";
		authors[] = { "Nife" };
		description = "Displays a short test screen to avoid players from shooting each other while loading the mission.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	loading_screen = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\loading_screen\functions";

			CFGFNC(postinit);
		};

		class functions {
			file = "\broma_framework\plugins\loading_screen\functions";

			CFGFNC(clientLoaded);
			CFGFNC(load);
		};
	};
};
