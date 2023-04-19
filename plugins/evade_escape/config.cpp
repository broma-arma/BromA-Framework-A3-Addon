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
			file = "\broma_framework\plugins\evade_escape\functions";
			CFGFNC(reachObject);
		};
	};
};

class BRM_FMK_Plugins {
	class evade_escape {
		name = "Evade and Escape";
		authors[] = {"Fer", "Nife"};
		version = 1;
		description = "Ends the mission when the specified units reach a certain point.";
	};
};
