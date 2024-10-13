class BRM_FMK {
	class Plugins {
		class prevent_reslot {
			name = "Prevent Reslotting";
			version = 1;
			authors[] = {"Nife", "Coryf88"};
			description = "As soon enough time has passed, the currently slotted player unit will be locked, blocking any attempts to change it.";
			tag = "BRM_FMK_Plugin_PreventReslot";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_PreventReslot {
		class functions {
			file = "\broma_framework\plugins\prevent_reslot\functions";
			class preInit {};
			class postInit {};
			class checkSlot {};
			class slotTaken {};
			class slotValid {};
			class lockSlot {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_PreventReslot {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
