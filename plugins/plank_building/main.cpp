#ifdef BRM_PLUGIN_META
	class plank_building {
		name = "Plank Building";
		version = 1;
		authors[] = {"plank", "Nife"};
		description = "This plugin allows you to place buildings and other objects.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_PlankBuilding {
	class functions {
		file = "broma_framework\plugins\plank_building\functions";
		class postInit {};
		class playerPostInit {};
		class deployFunctions {};
		class uiFunctions {};
		class apiFunctions {};
		class cancelFortAction {};
		class openSettingsAction {};
		class placeFortAction {};
		class confirmFortAction {};
	};
};
#endif

#ifdef BRM_PLUGIN_DIALOGS
	#include "dialogs\settings_dialog.hpp"
#endif
