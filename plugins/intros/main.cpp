#ifdef BRM_PLUGIN_META
	class intros {
		name = "Intro cutscenes";
		version = 1;
		authors[] = {"Nife", "Coryf88"};
		description = "Plays a pre-made intro cutscene to set the mood for the mission.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_Intros {
	class functions {
		file = "\broma_framework\plugins\intros\functions";
		class postInit {};
	};
};
#endif
