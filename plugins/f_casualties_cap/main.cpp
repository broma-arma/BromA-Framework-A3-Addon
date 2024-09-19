#ifdef BRM_PLUGIN_META
	class f_casualties_cap {
		name = "Casualty cap";
		version = 1;
		authors[] = {"Coryf88"};
		description = "Ends the mission after a certain parameter determined percentage of mission set groups have died.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_f_cas_cap {
	class functions {
		file = "\broma_framework\plugins\f_casualties_cap\functions";
		class setParams {};
		class postInit {};
		class CasualtiesCapCheck {};
	};
};
#endif
