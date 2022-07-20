#ifdef BRM_PLUGIN_META
	class ace3_spectator {
		name = "ACE3 Spectator plugin";
		disabled = 1;
		version = 1;
		authors[] = {"Nife"};
		conflict_plugins[] = {"vanilla_spectator"};
		description = "Manages some stuff about the spectator system.";
		postInit[] = {"BRM_FMK_ACE3_SPECTATOR_fnc_postInit"};
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif
