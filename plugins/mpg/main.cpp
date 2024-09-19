#ifdef BRM_PLUGIN_META
	class mpg {
		name = "MPG";
		version = 1;
		authors[] = {"Coryf88"};
		description = "Multiplayer garage";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_MPGarage {
	class functions {
		file = "\broma_framework\plugins\mpg\functions";
		class open {};
		class loadLeftContent {};
		class loadRightContent {};
		class getPylons {};
		class setPylonLoadout {};
	};
	class eventHandlers {
		file = "\broma_framework\plugins\mpg\functions\events";
		class onGarageEvent {};
		class onLeftTabSelect {};
		class onRightTabSelect {};
		class onLeftListSelected {};
		class onLeftSortChanged {};
		class onRightListSelected {};
		class onSearch {};
		class onMenuBar {};
		class onPylonConfigChanged {};
		class onSavesEvent {};
	};
};
#endif

#ifdef BRM_PLUGIN_DIALOGS
	#include "dialogs\displayGarage.hpp"
#endif
