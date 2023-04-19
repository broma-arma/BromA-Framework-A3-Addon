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
			file = "\broma_framework\plugins\radiofreq\functions";
			CFGFNC(postInit);
		};
	};
};

class BRM_FMK_Plugins {
	class radiofreq {
		name = "Radio channel generator";
		version = 1;
		authors[] = {"Nife"};
		description = "Generates radio channels and frequencies based on what groups are active in the mission.";
		postInit[] = {QFUNC(postInit)};
	};
};
