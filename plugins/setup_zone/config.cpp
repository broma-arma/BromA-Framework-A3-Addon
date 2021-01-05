#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "Setup zone";
		authors[] = { "Nife" };
		description = "Whenever a TvT mission is starting, players are forced to wait a set amount of time before being able to leave their start zones.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	setup_zone = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\setup_zone\functions";

			CFGFNC(setParams);
			CFGFNC(postinit);
		};
	};
};
