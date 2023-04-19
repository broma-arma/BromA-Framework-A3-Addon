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
			file = "\broma_framework\plugins\mission_conditions\functions";
			CFGFNC(postInit);
		};
	};

};

class BRM_FMK_Plugins {
	class mission_conditions {
		name = "Mission Conditions";
		version = 1;
		authors[] = {"Nife"};
		description = "Sets the mission conditions such as weather and time.";
		postInit[] = {QFUNC(postInit)};
	};
};
