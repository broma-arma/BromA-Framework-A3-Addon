#ifdef BRM_PLUGIN_META
	class mpg {
		name = "MPG";
		version = 1;
		authors[] = {"Coryf88"};
		description = "Multiplayer garage";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif

#ifdef BRM_PLUGIN_DIALOGS
	#include "dialogs\displayGarage.hpp"
#endif
