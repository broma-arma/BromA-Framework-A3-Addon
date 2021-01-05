#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "Plank Building";
		authors[] = { "plank", "Nife" };
		description = "This plugin allows you to place buildings and other objects.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	plank_building = QUOTE(ADDON);
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

#include "dialogs\settings_dialog.hpp"
