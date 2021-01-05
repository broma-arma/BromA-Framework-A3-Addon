#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "Spawn protection";
		authors[] = { "Nife", "Coryf88" };
		description = "Creates a protection zone around the insertion point, which can last forever or as long as the mission parameters determine, ensuring neither players or friendly vehicles can take damage while inside.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	spawn_protection = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\spawn_protection\functions";

			CFGFNC(setParams);
			CFGFNC(postinit);
		};

		class functions {
			file = "\broma_framework\plugins\spawn_protection\functions";

			CFGFNC(allowDamage);
			CFGFNC(clientMarker);
		};
	};
};
