#ifdef BRM_PLUGIN_META
	class mission_maker_tools {
		name = "Mission maker tools";
		version = 1;
		authors[] = {"Nife"};
		description = "Handy scripts like opening the Arsenal script available to the mission maker while in the editor.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_MissionMakerTools {
	class functions {
		file = "\broma_framework\plugins\mission_maker_tools\functions";
		class postInit {};
	};
};
#endif
