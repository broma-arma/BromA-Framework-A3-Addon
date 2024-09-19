#ifdef BRM_PLUGIN_META
	class f_remove_body {
		name = "Automatic body removal";
		authors[] = {"Coryf88"};
		version = 1;
		description = "Ensures dead units will have their bodies removed after a certain amount of time, granted they are apart players by a certain distance.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_f_remove_body {
	class functions {
		file = "\broma_framework\plugins\f_remove_body\functions";
		class postInit {};
		class removeBody {};
	};
};
#endif
