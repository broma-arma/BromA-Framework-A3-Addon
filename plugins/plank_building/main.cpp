#ifdef BRM_PLUGIN_META
	class plank_building
	{
		name = "Plank Building";
		version = 1;
		authors[] = {"plank","Nife"};
		description = "This plugin allows you to place buildings and other objects.";
		postInit[] = {"BRM_FMK_PlankBuilding_fnc_postInit", "BRM_FMK_PlankBuilding_fnc_playerPostInit"};
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif

#ifdef BRM_PLUGIN_DIALOGS
	#include "dialogs\settings_dialog.hpp"
#endif
