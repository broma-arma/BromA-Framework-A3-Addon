#ifdef BRM_PLUGIN_META
	class map_cover
	{
		name = "Map Cover";
		version = 1;
		authors[] = {"Nife"};
		description = "Highlights the AO in the map by enclosing it and darkening the unused part.";
		postInit[] = {"BRM_FMK_MapCover_fnc_postInit"};
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif
