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
			file = "\broma_framework\plugins\casualties_cap\functions";
			CFGFNC(postinit);
		};
	};

};

class BRM_FMK_Plugins {
	class casualties_cap {
		name = "Casualty cap";
		version = 1;
		authors[] = {"Coryf88"};
		description = "Ends the mission after a certain parameter determined percentage of players have died.";
		postInit[] = {QFUNC(postInit)};
	};
};
