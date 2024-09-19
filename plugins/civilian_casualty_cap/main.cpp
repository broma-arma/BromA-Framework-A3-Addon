#ifdef BRM_PLUGIN_META
	class civilian_casualty_cap {
		name = "Civilian casualty cap";
		version = 1;
		authors[] = {"Nife", "Coryf88"};
		description = "Punishes players for killing a parameter determined amount of civilians, compatible with both COOP and TvTs.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_CivilianCasualtyCap {
	class functions {
		file = "\broma_framework\plugins\civilian_casualty_cap\functions";
		class preInit {};
		class setParams {};
		class postInit {};
		class civInit {};
		class civKilled {};
	};
};
#endif
