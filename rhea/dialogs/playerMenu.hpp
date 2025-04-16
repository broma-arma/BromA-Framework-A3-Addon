class BRM_FMK_RHEA_main_playerMenu: ctrlMenu {
	colorBackground[] = { 0.1, 0.1, 0.1, 1 };
	class Items {
		items[] = {
			"Notify",
			"Teleport",
			"Health",
			"State"
		};
		class Notify {
			text = "Notify";
			action = "[_this select 0, 'Notify'] call BRM_FMK_RHEA_fnc_playerMenu;";
		};
		class Teleport {
			text = "Teleport";
			items[] = {
				"Teleport_GoTo",
				"Teleport_Bring",
				"Teleport_SendTo"
			};
		};
		class Teleport_GoTo {
			text = "Go To";
			action = "[_this select 0, 'GoTo'] call BRM_FMK_RHEA_fnc_playerMenu;";
		};
		class Teleport_Bring {
			text = "Bring";
			action = "[_this select 0, 'Bring'] call BRM_FMK_RHEA_fnc_playerMenu;";
		};
		class Teleport_SendTo {
			text = "Send To";
			action = "[_this select 0, 'SendTo'] call BRM_FMK_RHEA_fnc_playerMenu;";
		};
		class Health {
			text = "Health";
			items[] = {
				"Health_Heal",
				"Health_Kill"
			};
		};
		class Health_Heal {
			text = "Heal";
			action = "[_this select 0, 'Heal'] call BRM_FMK_RHEA_fnc_playerMenu;";
		};
		class Health_Kill {
			text = "Kill";
			action = "[_this select 0, 'Kill'] call BRM_FMK_RHEA_fnc_playerMenu;";
		};
		class State {
			text = "State";
			items[] = {
				"State_Freeze",
				"State_RepairArmFuel",
				"State_AssignLoadout",
				"State_Respawn"
			};
		};
		class State_Freeze {
			text = "Freeze";
			action = "[_this select 0, 'Freeze'] call BRM_FMK_RHEA_fnc_playerMenu;";
		};
		class State_RepairArmFuel {
			text = "Repair/Arm/Fuel";
			items[] = {
				"State_RepairArmFuel_All",
				"State_RepairArmFuel_Repair",
				"State_RepairArmFuel_Rearm",
				"State_RepairArmFuel_Refuel"
			};
		};
		class State_RepairArmFuel_All {
			text = "All";
			action = "[_this select 0, 'RepairArmFuel'] call BRM_FMK_RHEA_fnc_playerMenu;";
		};
		class State_RepairArmFuel_Repair {
			text = "Repair";
			action = "[_this select 0, 'Repair'] call BRM_FMK_RHEA_fnc_playerMenu;";
		};
		class State_RepairArmFuel_Rearm {
			text = "Rearm";
			action = "[_this select 0, 'Rearm'] call BRM_FMK_RHEA_fnc_playerMenu;";
		};
		class State_RepairArmFuel_Refuel {
			text = "Refuel";
			action = "[_this select 0, 'Refuel'] call BRM_FMK_RHEA_fnc_playerMenu;";
		};
		class State_AssignLoadout {
			text = "Assign Loadout";
			action = "[_this select 0, 'AssignLoadout'] call BRM_FMK_RHEA_fnc_playerMenu;";
		};
		class State_Respawn {
			text = "Respawn";
			action = "[_this select 0, 'Respawn'] call BRM_FMK_RHEA_fnc_playerMenu;";
		};
		class Separator {
			value = 0;
		};
		class Default {
			text = "$STR_3DEN_Display3DEN_MenuBar_Default_text";
			enable = 0;
		};
	};
};
