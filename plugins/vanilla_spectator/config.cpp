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
			file = "\broma_framework\plugins\vanilla_spectator\functions";
			CFGFNC(preInit);
		};
		class Functions {
			file = "\broma_framework\plugins\vanilla_spectator\functions";
			CFGFNC(getSettings);
			CFGFNC(centerOnTarget);
			CFGFNC(setSpectator);
		};
	};

};

class BRM_FMK_Plugins {
	class vanilla_spectator {
		name = "Vanilla Spectator System";
		version = 1;
		authors[] = {"Bohemia Interactive", "Nife"};
		conflict_plugins[] = {"ace3_spectator"};
		description = "This plugin enables compatibility with the vanilla spectator system.";
		preInit[] = {QFUNC(preInit)};
	};
};
