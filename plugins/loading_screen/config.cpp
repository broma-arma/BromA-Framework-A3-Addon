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
			file = "\broma_framework\plugins\loading_screen\functions";
			CFGFNC(postinit);
		};
		class functions {
			file = "\broma_framework\plugins\loading_screen\functions";
			CFGFNC(clientLoaded);
			CFGFNC(load);
		};
	};

};

class BRM_FMK_Plugins {
	class loading_screen {
		name = "Loading screen";
		version = 1.5;
		authors[] = {"Nife"};
		description = "Displays a short test screen to avoid players from shooting each other while loading the mission.";
		postInit[] = {QFUNC(postInit)};
	};
};
