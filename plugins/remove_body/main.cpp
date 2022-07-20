#ifdef BRM_PLUGIN_META
	class remove_body {
		name = "Automatic body removal";
		authors[] = {"Coryf88"};
		version = 1;
		description = "Ensures dead units will have their bodies removed after a certain amount of time, granted they are apart players by a certain distance.";
		postInit[] = {"BRM_FMK_remove_body_fnc_postInit"};
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif
