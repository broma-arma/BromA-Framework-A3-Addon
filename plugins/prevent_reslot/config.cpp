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
			class unlockSlots {};
			class utility {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_PreventReslot {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK", "BRM_FMK_Rhea" };
	};
};

class ctrlMenuStrip;
class BRM_FMK_RHEA_main {
	class Controls {
		class MenuStrip: ctrlMenuStrip {
			class Items {
				class Utility {
					items[] += {"prevent_reslot_SlotUnlocker"};
				};
				class prevent_reslot_SlotUnlocker {
					text = "Prevent Reslot - Slot Unlocker";
					tooltip = "Shows a list of locked slots and allows easy unlocking.";
					action = "call BRM_FMK_Plugin_PreventReslot_fnc_utility";

					BRM_FMK_RHEA_enable = "isMultiplayer && ""prevent_reslot"" call BRM_FMK_fnc_isPluginActive";
				};
			};
		};
	};
};
