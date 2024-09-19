#ifdef BRM_PLUGIN_META
	class ocap_plugin {
		name = "OCAP Plugin";
		version = 0.5;
		authors[] = {"MrGoodson", "Nife"};
		description = "Plugin to initialize all OCAP functions.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_OCAP {
	class functions {
		file = "\broma_framework\plugins\ocap_plugin\functions";
		class init {};
	};
};
#endif
