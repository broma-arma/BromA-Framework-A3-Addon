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
			file = "\broma_framework\plugins\setup_zone\functions";
			CFGFNC(postinit);
		};
		class functions {
			file = "\broma_framework\plugins\setup_zone\functions";
			CFGFNC(getSettings);
		};
	};

};
class BRM_FMK_Plugins {
	class setup_zone {
		name = "Setup zone";
		version = 1;
		authors[] = {"Nife"};
		description = "Whenever a TvT mission is starting, players are forced to wait a set amount of time before being able to leave their start zones.";
		postInit[] = {QFUNC(postInit)};
	};
};
