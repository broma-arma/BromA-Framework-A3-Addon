#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "Evade and Escape";
		authors[] = { "BromA" };
		description = "Ends the mission when the specified units reach a certain point.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	f_evade_escape = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class Functions {
			file = "\broma_framework\plugins\f_evade_escape\functions";

			CFGFNC(reachObject);
		};
	};
};
