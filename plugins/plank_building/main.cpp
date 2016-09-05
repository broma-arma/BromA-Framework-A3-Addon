
#ifdef BRM_PLUGIN_META
	class plank_building
	{
		name = "Plank Building";
		version = 1;
		authors[] = {"plank","Nife"};
		description = "This plugin allows you to place buildings and other objects.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif

#ifdef BRM_PLUGIN_DIALOGS
	#include "dialogs\settings_dialog.hpp"
	#include "dialogs\plank_macros.h"
#endif