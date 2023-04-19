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
			file = "\broma_framework\plugins\acre2_plugin\functions";
			CFGFNC(postInit);
		};
	};

};

class BRM_FMK_Plugins {
	class acre2_plugin {
		name = "ACRE2 Plugin";
		version = 1;
		authors[] = {"Nife"};
		description = "Sets up environment variables and functions necessary to work with the Advanced Combat Radio Environment 2 radio system.";
		postInit[] = {QFUNC(postInit)};
	};
};
