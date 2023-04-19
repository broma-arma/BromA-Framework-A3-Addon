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
			file = "\broma_framework\plugins\headless_client\functions";
			CFGFNC(postinit);
		};
	};

};

class BRM_FMK_Plugins {
	class headless_client {
		name = "Headless Client";
		version = 1;
		authors[] = {"Nife", "Coryf88"};
		description = "Suite of functions made to facilitate the usage of the Headless Client and its environment variables.";
		postInit[] = {QFUNC(postInit)};
	};
};
