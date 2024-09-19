#ifdef BRM_PLUGIN_META
	class time_accel {
		name = "Time Acceleration";
		version = 1;
		authors[] = {"Nife"};
		description = "Accelerates time as determined by mission parameters.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_TimeAcceleration {
	class functions {
		file = "\broma_framework\plugins\time_accel\functions";
		class setParams {};
		class postInit {};
	};
};
#endif
