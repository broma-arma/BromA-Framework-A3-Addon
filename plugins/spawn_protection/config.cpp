#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\spawn_protection\functions";
			CFGFNC(postinit);
		};
		class functions {
			file = "\broma_framework\plugins\spawn_protection\functions";
			CFGFNC(getSettings);
			CFGFNC(allowDamage);
			CFGFNC(clientMarker);
			CFGFNC(triggerCondition);
			CFGFNC(triggerActivation);
		};
	};
};

class BRM_FMK_Plugins {
	class spawn_protection {
		name = "Spawn protection";
		version = 1;
		authors[] = {"Nife", "Coryf88"};
		description = "Creates a protection zone around the insertion point, which can last forever or as long as the mission parameters determine, ensuring neither players or friendly vehicles can take damage while inside.";
		postInit[] = {QFUNC(postInit)};
	};
};
