#ifdef BRM_PLUGIN_META
	class loading_screen {
		name = "Loading screen";
		version = 1.5;
		authors[] = {"Nife", "Coryf88"};
		description = "Displays a short test screen to avoid players from shooting each other while loading the mission.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_LoadingScreen {
	class functions {
		file = "\broma_framework\plugins\loading_screen\functions";
		class postInit {};
		class clientLoaded {};
		class load {};
	};
};
#endif
