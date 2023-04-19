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
			file = "\broma_framework\plugins\ao_limit\functions";
			CFGFNC(postinit);
		};
		class functions {
			file = "\broma_framework\plugins\ao_limit\functions";
			CFGFNC(getSettings);
		};
	};

};

class BRM_FMK_Plugins {
	class ao_limit {
		name = "AO Limit";
		version = 1;
		authors[] = {"Nife"};
		description = "Displays a message (or anything nastier) to players who leave the designated Area of Operations.";
		postInit[] = {QFUNC(postInit)};
	};
};
