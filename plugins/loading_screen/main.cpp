#ifdef BRM_PLUGIN_META
	class loading_screen {
		name = "Loading screen";
		version = 1.5;
		authors[] = {"Nife"};
		description = "Displays a short test screen to avoid players from shooting each other while loading the mission.";
		postInit[] = {"BRM_FMK_LoadingScreen_fnc_postInit"};
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif
