#ifdef BRM_PLUGIN_META
	class vanilla_spectator {
		name = "Vanilla Spectator System";
		version = 1;
		authors[] = {"Bohemia Interactive", "Nife"};
		conflict_plugins[] = {"ace3_spectator"};
		description = "This plugin enables compatibility with the vanilla spectator system.";
		preInit[] = {"BRM_FMK_VanillaSpectator_fnc_preInit"};
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif
