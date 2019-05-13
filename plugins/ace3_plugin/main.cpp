
#ifdef BRM_PLUGIN_META
	class ace3_plugin
	{
		name = "ACE3 Plugin";
		version = 1;
		authors[] = {"nigel"};
		description = "Allows for the easy configuration of the ACE3 mod settings, including the Medical system and other modules.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif