#ifdef BRM_PLUGIN_META
	class team_roster {
		name = "Team Roster";
		version = 1;
		authors[] = {"Coryf88"};
		description = "Creates a handy list of all friendly units separated by group name and position.";
		postInit[] = {"BRM_FMK_TeamRoster_fnc_postInit"};
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif

#ifdef BRM_PLUGIN_DIALOGS
	#include "dialogs\dialog.hpp"
#endif
