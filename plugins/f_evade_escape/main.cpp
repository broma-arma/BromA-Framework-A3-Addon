#ifdef BRM_PLUGIN_META
	class f_evade_escape {
		name = "Evade and Escape";
		authors[] = {"Nife", "Coryf88"};
		version = 1;
		description = "Ends the mission when the specified units reach a certain point.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_f_evade_escape {
	class functions {
		class reachObject {};
	};
};
#endif
