class BRM_FMK {
	class Plugins {
		class mpg {
			name = "MPG";
			version = 1;
			authors[] = {"Coryf88"};
			description = "Multiplayer garage";
		};
	};
};

class CfgFunctions {
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
};

#include "dialogs\displayGarage.hpp"

class CfgPatches {
	class BRM_FMK_Plugin_MPGarage {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};