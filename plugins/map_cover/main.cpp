#ifdef BRM_PLUGIN_META
	class map_cover {
		name = "Map Cover";
		version = 1;
		authors[] = {"Nife", "Coryf88"};
		description = "Highlights the AO in the map by enclosing it and darkening the unused part.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_MapCover {
	class functions {
		file = "\broma_framework\plugins\map_cover\functions";
		class postInit {};
	};
};
#endif
