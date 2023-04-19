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
			file = "\broma_framework\plugins\tfar_plugin\functions";
			CFGFNC(postInit);
			CFGFNC(autoSetupRadios);
		};
	};
};

class BRM_FMK_Plugins {
	class tfar_plugin {
		name = "TFAR Plugin";
		version = 1;
		authors[] = {"Nife"};
		description = "Sets up environment variables and functions necessary to work with the Task Force Radio Alpha radio system.";
		postInit[] = {QFUNC(postInit)};
	};
};
