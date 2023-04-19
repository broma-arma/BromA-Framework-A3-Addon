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
			file = "\broma_framework\plugins\time_accel\functions";
			CFGFNC(postinit);
		};
	};
};

class BRM_FMK_Plugins {
	class time_accel {
		name = "Time Acceleration";
		version = 1;
		authors[] = {"Nife"};
		description = "Accelerates time as determined by mission parameters.";
		postInit[] = {QFUNC(postInit)};
	};
};
