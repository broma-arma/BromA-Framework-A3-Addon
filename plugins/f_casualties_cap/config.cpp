#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "Casualty cap";
		authors[] = { "Fer", "Head", "Xiathorn", "Headspace", "Wolfenswan" };
		description = "Ends the mission after a certain parameter determined percentage of mission set groups have died.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	f_casualties_cap = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\f_casualties_cap\functions";

			CFGFNC(setParams);
			CFGFNC(postinit);
			CFGFNC(CasualtiesCapCheck);
		};
	};
};
