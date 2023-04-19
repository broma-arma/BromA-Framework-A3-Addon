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
		class Functions {
			file = "\broma_framework\plugins\ocap_plugin\functions";
			CFGFNC(init);
		};
	};

};

class BRM_FMK_Plugins {
	class ocap_plugin {
		name = "OCAP Plugin";
		version = 0.5;
		authors[] = {"MrGoodson", "Nife"};
		description = "Plugin to initialize all OCAP functions.";
	};
};
