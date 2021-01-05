#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "Commander Lock";
		authors[] = { "Nife" };
		description = "Forbids players from firing weapons or entering vehicles until the mission Commander gives the all-clear. Compatible with TvT with up to three sides, where all COs need to be ready in order for the mission to begin.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	commander_lock = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\commander_lock\functions";

			CFGFNC(postinit);
		};
	};
};
