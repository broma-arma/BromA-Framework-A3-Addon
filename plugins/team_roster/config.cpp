#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "Team Roster";
		authors[] = { "Coryf88" };
		description = "Creates a handy list of all friendly units separated by group name and position.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	team_roster = QUOTE(ADDON);
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

#include "dialogs\dialog.hpp"
