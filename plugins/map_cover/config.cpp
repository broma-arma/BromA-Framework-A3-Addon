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
			file = "\broma_framework\plugins\map_cover\functions";
			CFGFNC(postInit);
		};
	};

};

class BRM_FMK_Plugins {
	class map_cover {
		name = "Map Cover";
		version = 1;
		authors[] = {"Nife"};
		description = "Highlights the AO in the map by enclosing it and darkening the unused part.";
		postInit[] = {QFUNC(postInit)};
	};
};
