#ifdef BRM_PLUGIN_META
	class intros {
		name = "Intro cutscenes";
		version = 1;
		authors[] = {"Nife"};
		description = "Plays a pre-made intro cutscene to set the mood for the mission.";
		postInit[] = {"BRM_FMK_Intros_fnc_postInit"};
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif
