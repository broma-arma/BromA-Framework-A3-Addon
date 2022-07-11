#ifdef BRM_PLUGIN_META
	class civilian_casualty_cap {
		name = "Civilian casualty cap";
		version = 1;
		authors[] = {"Nife"};
		description = "Punishes players for killing a parameter determined amount of civilians, compatible with both COOP and TvTs.";
		postInit[] = {"BRM_FMK_CivilianCasualtyCap_fnc_postInit"};
	};
#endif

#ifdef BRM_PARAMS_TIME
	#include "Parameters.cpp"
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif
