#ifdef BRM_PLUGIN_META
	class ace3_spectator {
		name = "ACE3 Spectator plugin";
		version = 1;
		authors[] = {"Nife", "Coryf88"};
		conflict_plugins[] = {"vanilla_spectator"};
		description = "Manages some stuff about the spectator system.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_ACE3_SPECTATOR {
	class functions {
		file = "\broma_framework\plugins\ace3_spectator\functions";
		class postInit {};
	};
};
#endif
