#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "Time limit";
		authors[] = { "Nife" };
		description = "Ends the mission after a parameter set amount of time has passed, and based on mission settings alerts the player on relevant times to the mission maker.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	time_limit = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\time_limit\functions";

			CFGFNC(setParams);
			CFGFNC(postinit);
		};

		class Functions {
			file = "\broma_framework\plugins\time_limit\functions";

			CFGFNC(addTime);
			CFGFNC(removeTime);
		};
	};
};
