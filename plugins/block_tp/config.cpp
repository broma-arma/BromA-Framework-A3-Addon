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
			file = "\broma_framework\plugins\block_tp\functions";
			CFGFNC(postinit);
		};
	};

};

class BRM_FMK_Plugins {
	class block_tp {
		name = "Block third-person";
		version = 1;
		authors[] = {"Nife", "Coryf88"};
		description = "Simple script meant to stop players from using third person mode if they do not meet certain conditions. (Being a vehicle driver/commander)";
		postInit[] = {QFUNC(postInit)};
	};
};
