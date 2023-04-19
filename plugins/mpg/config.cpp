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

class BRM_FMK_Plugins {
	class mpg {
		name = "MPG";
		version = 1;
		authors[] = {"Coryf88"};
		description = "Multiplayer garage";
	};
};

#include "dialogs\displayGarage.hpp"
