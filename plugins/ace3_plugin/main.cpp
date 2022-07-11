#ifdef BRM_PLUGIN_META
	class ace3_plugin
	{
		name = "ACE3 Plugin";
		version = 1;
		authors[] = {"nigel"};
		description = "Allows for the easy configuration of the ACE3 mod settings, including the Medical system and other modules.";
		postInit[] = {"BRM_FMK_ACE3_fnc_postInit"};
	};
#endif

#ifdef BRM_PARAMS_PLAYER
	#include "Parameters.cpp"
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif
