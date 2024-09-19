#ifdef BRM_PLUGIN_META
	class team_roster {
		name = "Team Roster";
		version = 1;
		authors[] = {"Coryf88"};
		description = "Creates a handy list of all friendly units separated by group name and position.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_TeamRoster {
	class functions {
		file = "\broma_framework\plugins\team_roster\functions";
		class postInit {};
		class roster {};
	};
};
#endif

#ifdef BRM_PLUGIN_DIALOGS
	#include "dialogs\dialog.hpp"
#endif
