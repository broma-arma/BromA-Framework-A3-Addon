#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "Civilian casualty cap";
		authors[] = { "Nife" };
		description = "Punishes players for killing a parameter determined amount of civilians, compatible with both COOP and TvTs.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	civilian_casualty_cap = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\civilian_casualty_cap\functions";

			CFGFNC(preinit);
			CFGFNC(setParams);
			CFGFNC(postinit);
		};

		class functions {
			file = "\broma_framework\plugins\civilian_casualty_cap\functions";

			CFGFNC(civInit);
			CFGFNC(civKilled);
		};

	};
};
