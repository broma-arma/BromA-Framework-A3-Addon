#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "Friendly fire";
		authors[] = { "Nife" };
		description = "Alerts both the perpetrator and the victim whenever a friendly fire incident takes place.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	friendly_fire = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\friendly_fire\functions";

			CFGFNC(postinit);
		};

		class Functions {
			file = "\broma_framework\plugins\friendly_fire\functions";

			CFGFNC(alert);
		};
	};
};
