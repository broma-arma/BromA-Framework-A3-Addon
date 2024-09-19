#ifdef BRM_PLUGIN_META
	class ao_limit {
		name = "AO Limit";
		version = 1;
		authors[] = {"Nife"};
		description = "Displays a message (or anything nastier) to players who leave the designated Area of Operations.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_AOLimit {
	class functions {
		file = "\broma_framework\plugins\ao_limit\functions";
		class postInit {};
	};
};
#endif
