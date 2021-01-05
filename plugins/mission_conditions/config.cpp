#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "Mission Conditions";
		authors[] = { "Nife" };
		description = "Sets the mission conditions such as weather and time.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	mission_conditions = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\mission_conditions\functions";

			CFGFNC(postInit);
			CFGFNC(setParams);
		};
	};
};
