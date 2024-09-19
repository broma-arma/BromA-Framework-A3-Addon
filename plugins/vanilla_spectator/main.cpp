#ifdef BRM_PLUGIN_META
	class vanilla_spectator {
		name = "Vanilla Spectator System";
		version = 1;
		authors[] = {"Bohemia Interactive", "Nife", "Coryf88"};
		conflict_plugins[] = {"ace3_spectator"};
		description = "This plugin enables compatibility with the vanilla spectator system.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_VanillaSpectator {
	class functions {
		file = "\broma_framework\plugins\vanilla_spectator\functions";
		class preInit {};
		class getSettings {};
		class centerOnTarget {};
	};
};
#endif
