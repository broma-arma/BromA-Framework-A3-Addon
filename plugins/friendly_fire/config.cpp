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
			file = "\broma_framework\plugins\friendly_fire\functions";
			CFGFNC(postinit);
		};

		class Functions {
			file = "\broma_framework\plugins\friendly_fire\functions";
			CFGFNC(getSettings);
			CFGFNC(alert);
		};
	};

};

class BRM_FMK_Plugins {
	class friendly_fire {
		name = "Friendly fire";
		version = 1;
		authors[] = {"Nife"};
		description = "Alerts both the perpetrator and the victim whenever a friendly fire incident takes place.";
		postInit[] = {QFUNC(postInit)};
	};
};
