#ifdef BRM_PLUGIN_META
	class mission_maker_tools {
		name = "Mission maker tools";
		version = 1;
		authors[] = {"Nife"};
		description = "Handy scripts like opening the Arsenal script available to the mission maker while in the editor.";
		postInit[] = {"BRM_FMK_MissionMakerTools_fnc_postInit"};
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif
