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
			file = "\broma_framework\plugins\mission_maker_tools\functions";
			CFGFNC(postInit);
		};
	};

};

class BRM_FMK_Plugins {
	class mission_maker_tools {
		name = "Mission maker tools";
		version = 1;
		authors[] = {"Nife"};
		description = "Handy scripts like opening the Arsenal script available to the mission maker while in the editor.";
		postInit[] = {QFUNC(postInit)};
	};
};
