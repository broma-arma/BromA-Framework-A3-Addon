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
			file = "\broma_framework\plugins\civilian_casualty_cap\functions";
			CFGFNC(postinit);
		};
		class functions {
			file = "\broma_framework\plugins\civilian_casualty_cap\functions";
			CFGFNC(getSettings);
			CFGFNC(civInit);
			CFGFNC(civKilled);
		};
	};

};

class BRM_FMK_Plugins {
	class civilian_casualty_cap {
		name = "Civilian casualty cap";
		version = 1;
		authors[] = {"Nife"};
		description = "Punishes players for killing a parameter determined amount of civilians, compatible with both COOP and TvTs.";
		postInit[] = {QFUNC(postInit)};
	};
};
