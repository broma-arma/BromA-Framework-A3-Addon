#ifdef BRM_PLUGIN_META
	class radiofreq
	{
		name = "Radio channel generator";
		version = 1;
		authors[] = {"Nife"};
		description = "Generates radio channels and frequencies based on what groups are active in the mission.";
		postInit[] = {"BRM_FMK_RadioFreq_fnc_postInit"};
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif
