class BRM_FMK {
	class Plugins {
		class plank_building {
			name = "Plank Building";
			version = 1;
			authors[] = {"plank", "Nife"};
			description = "This plugin allows you to place buildings and other objects.";
			tag = "BRM_FMK_Plugin_PlankBuilding";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_PlankBuilding {
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
};

#include "dialogs\settings_dialog.hpp"

class CfgPatches {
	class BRM_FMK_PlankBuilding {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
