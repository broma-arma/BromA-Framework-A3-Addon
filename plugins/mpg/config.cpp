#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "MPG";
		authors[] = { "Coryf88" };
		description = "Multiplayer garage";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	mpg = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class general {
			file = "\broma_framework\plugins\mpg\functions";

			CFGFNC(open);

			CFGFNC(loadLeftContent);

			CFGFNC(loadRightContent);

			CFGFNC(getPylons);
			CFGFNC(setPylonLoadout);
		};

		class eventHandlers {
			file = "\broma_framework\plugins\mpg\functions\events";

			CFGFNC(onGarageEvent);

			CFGFNC(onLeftTabSelect);
			CFGFNC(onRightTabSelect);

			CFGFNC(onLeftListSelected);
			CFGFNC(onLeftSortChanged);
			CFGFNC(onRightListSelected);

			CFGFNC(onSearch);

			CFGFNC(onMenuBar);

			CFGFNC(onPylonConfigChanged);

			CFGFNC(onSavesEvent);
		};
	};
};

#include "dialogs\displayGarage.hpp"
