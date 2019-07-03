#ifdef BRM_PLUGIN_META
	class ch_view_distance {
		name = "View Distance Settings";
		version = "1.13";
		authors[] = {"Champ"};
		description = "Allows for the player to change their view/object draw distance. Default key is Ctrl + \.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif

#ifdef BRM_PLUGIN_DIALOGS
	#include "dialogs\dialog.hpp"
#endif
