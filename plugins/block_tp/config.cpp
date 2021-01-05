#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "Block third-person";
		authors[] = { "Nife", "Coryf88" };
		description = "Simple script meant to stop players from using third person mode if they do not meet certain conditions. (Being a vehicle driver/commander)";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	block_tp = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\block_tp\functions";

			CFGFNC(setParams);
			CFGFNC(postinit);
		};
	};
};
