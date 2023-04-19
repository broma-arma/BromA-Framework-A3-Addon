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
			file = "\broma_framework\plugins\team_roster\functions";
			CFGFNC(postInit);
			CFGFNC(roster);
		};
	};

};

class BRM_FMK_Plugins {
	class team_roster {
		name = "Team Roster";
		version = 1;
		authors[] = {"Coryf88"};
		description = "Creates a handy list of all friendly units separated by group name and position.";
		postInit[] = {QFUNC(postInit)};
	};
};

#include "dialogs\dialog.hpp"
