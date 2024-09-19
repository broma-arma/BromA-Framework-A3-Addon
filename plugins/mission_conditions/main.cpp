#ifdef BRM_PLUGIN_META
	class mission_conditions {
		name = "Mission Conditions";
		version = 1;
		authors[] = {"Nife"};
		description = "Sets the mission conditions such as weather and time.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_MissionConditions {
	class functions {
		file = "\broma_framework\plugins\mission_conditions\functions";
		class setParams {};
		class postInit {};
	};
};
#endif
