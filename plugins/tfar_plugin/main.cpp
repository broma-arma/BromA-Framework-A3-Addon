#ifdef BRM_PLUGIN_META
	class tfar_plugin {
		name = "TFAR Plugin";
		version = 1;
		authors[] = {"Nife"};
		description = "Sets up environment variables and functions necessary to work with the Task Force Radio Alpha radio system.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_TFAR {
	class functions {
		file = "\broma_framework\plugins\tfar_plugin\functions";
		class postInit {};
		class autoSetupRadios {};
	};
};
#endif
