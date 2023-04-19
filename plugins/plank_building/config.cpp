#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "broma_framework\plugins\plank_building\functions";
			CFGFNC(postInit);
			CFGFNC(playerPostInit);
		};

		class Functions {
			file = "broma_framework\plugins\plank_building\functions";
			CFGFNC(deployFunctions);
			CFGFNC(uiFunctions);
			CFGFNC(apiFunctions);

			CFGFNC(cancelFortAction);
			CFGFNC(openSettingsAction);
			CFGFNC(placeFortAction);
			CFGFNC(confirmFortAction);
		};
	};

};

class BRM_FMK_Plugins {
	class plank_building {
		name = "Plank Building";
		version = 1;
		authors[] = {"plank", "Nife"};
		description = "This plugin allows you to place buildings and other objects.";
		postInit[] = {QFUNC(postInit), QFUNC(playerPostInit)};
	};
};

#include "dialogs\settings_dialog.hpp"
