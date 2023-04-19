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
			file = "\broma_framework\plugins\ace3_spectator\functions";
			CFGFNC(postinit);
		};
	};

};

class BRM_FMK_Plugins {
	class ace3_spectator {
		name = "ACE3 Spectator plugin";
		disabled = 1;
		version = 1;
		authors[] = {"Nife"};
		conflict_plugins[] = {"vanilla_spectator"};
		description = "Manages some stuff about the spectator system.";
		postInit[] = {QFUNC(postInit)};
	};
};
