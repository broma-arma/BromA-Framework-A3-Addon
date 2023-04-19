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
			file = "\broma_framework\plugins\prevent_reslot\functions";
			CFGFNC(postInit);
		};

		class functions {
			file = "\broma_framework\plugins\prevent_reslot\functions";
			CFGFNC(getSettings);
		};
	};

};

class BRM_FMK_Plugins {
	class prevent_reslot {
		name = "Prevent Reslotting";
		version = 1;
		authors[] = {"Nife"};
		description = "As soon enough time has passed, the currently slotted player unit will be locked, blocking any attempts to change it.";
		postInit[] = {QFUNC(postInit)};
	};
};
