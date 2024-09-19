class BRM_FMK {
	class Plugins {
		class team_roster {
			name = "Team Roster";
			version = 1;
			authors[] = {"Coryf88"};
			description = "Creates a handy list of all friendly units separated by group name and position.";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_TeamRoster {
		class functions {
			file = "\broma_framework\plugins\team_roster\functions";
			class postInit {};
			class roster {};
		};
	};
};

#include "dialogs\dialog.hpp"

class CfgPatches {
	class BRM_FMK_TeamRoster {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
