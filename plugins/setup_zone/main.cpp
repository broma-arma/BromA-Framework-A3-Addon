#ifdef BRM_PLUGIN_META
	class setup_zone {
		name = "Setup zone";
		version = 1;
		authors[] = {"Nife", "Coryf88"};
		description = "Whenever a TvT mission is starting, players are forced to wait a set amount of time before being able to leave their start zones.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_SetupZone {
	class functions {
		file = "\broma_framework\plugins\setup_zone\functions";
		class setParams {};
		class postInit {};
	};
};
#endif
