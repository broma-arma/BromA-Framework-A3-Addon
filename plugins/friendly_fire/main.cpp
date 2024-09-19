#ifdef BRM_PLUGIN_META
	class friendly_fire {
		name = "Friendly fire";
		version = 1;
		authors[] = {"Nife", "Coryf88"};
		description = "Alerts both the perpetrator and the victim whenever a friendly fire incident takes place.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_FriendlyFire {
	class functions {
		file = "\broma_framework\plugins\friendly_fire\functions";
		class postInit {};
		class alert {};
	};
};
#endif
