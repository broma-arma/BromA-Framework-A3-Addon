
#ifdef BRM_PLUGIN_META
	class ocap_plugin
	{
		name = "OCAP Plugin";
		version = 0.5;
		authors[] = {"MrGoodson", "Nife"};
		description = "Plugin to initialize all OCAP functions.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif