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
			file = "\broma_framework\plugins\intros\functions";
			CFGFNC(postinit);
		};

		class functions {
			file = "\broma_framework\plugins\intros\functions";
			CFGFNC(getSettings);
		};
	};

};

class BRM_FMK_Plugins {
	class intros {
		name = "Intro cutscenes";
		version = 1;
		authors[] = {"Nife"};
		description = "Plays a pre-made intro cutscene to set the mood for the mission.";
		postInit[] = {QFUNC(postInit)};
	};
};
