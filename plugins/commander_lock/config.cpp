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
			file = "\broma_framework\plugins\commander_lock\functions";
			CFGFNC(postinit);
		};
		class functions {
			file = "\broma_framework\plugins\commander_lock\functions";
			CFGFNC(getSettings);
		};
	};

};

class BRM_FMK_Plugins {
	class commander_lock {
		name = "Commander Lock";
		version = 1;
		authors[] = {"Nife"};
		description = "Forbids players from firing weapons or entering vehicles until the mission Commander gives the all-clear. Compatible with TvT with up to three sides, where all COs need to be ready in order for the mission to begin.";
		postInit[] = {QFUNC(postInit)};
	};
};
