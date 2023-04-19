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
			file = "\broma_framework\plugins\remove_body\functions";
			CFGFNC(postinit);
		};
		class Functions {
			file = "\broma_framework\plugins\remove_body\functions";
			CFGFNC(getSettings);
			CFGFNC(removeBody);
		};
	};

};

class BRM_FMK_Plugins {
	class remove_body {
		name = "Automatic body removal";
		authors[] = {"Coryf88"};
		version = 1;
		description = "Ensures dead units will have their bodies removed after a certain amount of time, granted they are apart players by a certain distance.";
		postInit[] = {QFUNC(postInit)};
	};
};
