class BRM_FMK_RHEA_main {
	idd = 7268;
	onLoad = "_this call BRM_FMK_RHEA_fnc_initMainMenu";
	onUnload = "";

	class ControlsBackground {};
	class Controls {
		class btnClose: RscButton {
			action = "findDisplay getNumber (configFile >> 'BRM_FMK_RHEA_main' >> 'idd') closeDisplay 0;";
			text = "X";
			tooltip = "Close this menu.";
			x = 39.5 * GUI_GRID_W + GUI_GRID_X;
			y = 0 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.5 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,1};
			colorBackgroundActive[] = IGUI_ERROR_COLOR;
		};
		class listPlayers: RscListbox {
			idc = 2100;
			style = LB_MULTI;

			x = 0 * GUI_GRID_W + GUI_GRID_X;
			y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 24.5 * GUI_GRID_H;
			colorBackground[] = {0.05,0.05,0.05,1};
		};
		class listTasks: listPlayers {
			idc = 2101;

			x = 33.5 * GUI_GRID_W + GUI_GRID_X;
		};
		class MenuStrip: ctrlMenuStrip {
			onLoad = "_this + ['OnLoad'] call BRM_FMK_RHEA_fnc_menuBar;";
			idc = 2102;
			x = 0 * GUI_GRID_W + GUI_GRID_X;
			y = 0 * GUI_GRID_H + GUI_GRID_Y;
			w = 39.5 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			colorStripBackground[] = {0,0,0,1};
			colorBackground[] = {0.1,0.1,0.1,1};
			class Items {
				items[] = {
					"Rhea",
					"Tools",
					"Mission",
					"Select",
					"Utility"
				};
				class Rhea {
					text = "Rhea";
					items[] = {
						"Rhea_Options",
						"Rhea_Logout",
						"Rhea_Close"
					};
				};
				class Rhea_Options {
					text = "Options";
					items[] = {
						"Rhea_Options_ShowAI",
						"Rhea_Options_ShowDead"
					};
				};
				class Rhea_Options_ShowAI {
					text = "Show AI";
					data = "ShowAI";
					tooltip = "Toggle showing of AI in the unit list.";
					type = "CheckBox";
					default = "true";

					BRM_FMK_RHEA_checked = "profileNamespace getVariable 'RHEA_cfg_showai'";
				};
				class Rhea_Options_ShowDead {
					text = "Show Dead Players";
					data = "ShowDead";
					tooltip = "Toggle showing of dead units in the unit list.";
					type = "CheckBox";
					default = "false";

					BRM_FMK_RHEA_checked = "profileNamespace getVariable 'RHEA_cfg_showdead'";
				};
				class Rhea_Logout {
					text = "Logout";
					action="call BRM_FMK_RHEA_fnc_logout;";
					tooltip = "Logout.";
				};
				class Rhea_Close {
					text = "Close";
					action="findDisplay getNumber (configFile >> 'BRM_FMK_RHEA_main' >> 'idd') closeDisplay 0;";
					tooltip = "Close this menu.";
				};
				class Tools {
					text = "Tools";
					items[] = {
						"Tools_Zeus",
						"Tools_Arsenal",
						"Tools_Camera",
						"Tools_Debug"
					};
				};
				class Tools_Zeus {
					text = "Zeus";
					data = "Zeus";

					BRM_FMK_RHEA_checked = "!isNull getAssignedCuratorLogic player";
				};
				class Tools_Arsenal {
					text = "Arsenal";
					items[] = {
						"Tools_Arsenal_BIS",
						"Tools_Arsenal_ACE"
					};
				};
				class Tools_Arsenal_BIS {
					text = "BIS";
					data = "Arsenal_BIS";
					tooltip = "Opens BIS's Virtual Arsenal.";
				};
				class Tools_Arsenal_ACE {
					text = "ACE";
					data = "Arsenal_ACE";
					tooltip = "Opens ACE's Virtual Arsenal.";

					BRM_FMK_RHEA_enable = QUOTE(HAS_ADDON('ace_arsenal'));
				};
				class Tools_Camera {
					text = "Camera";
					data = "Camera";
					tooltip = "Opens the Splendid Camera.";
				};
				class Tools_Debug {
					text = "Debug";
					data = "Debug";
				};
				class Mission {
					text = "Mission";
					items[] = {
						"Mission_Respawn",
						"Mission_DisableCommanderLock",
						"Mission_TimeLimit",
						"Mission_Conditions",
						"Mission_End"
					};
				};
				class Mission_Respawn {
					text = "Respawn";
					items[] = {
						"Mission_Respawn_Move",
						"Mission_Respawn_DisableProtection"
					};
				};
				class Mission_Respawn_Move {
					text = "Move";
					data = "MoveRespawn";
				};
				class Mission_Respawn_DisableProtection {
					text = "Disable Protection";
					data = "DisableSpawnProtection";

					BRM_FMK_RHEA_enable = QUOTE(USES_BRMFMK_PLUGIN('spawn_protection'));
				};
				class Mission_DisableCommanderLock {
					text = "Disable Commander Lock";
					data = "DisableCommanderLock";

					BRM_FMK_RHEA_enable = QUOTE(USES_BRMFMK_PLUGIN('commander_lock'));
				};
				class Mission_TimeLimit {
					text = "Time Limit";
					data = "TimeLimit";

					BRM_FMK_RHEA_enable = QUOTE(USES_BRMFMK_PLUGIN('time_limit'));
				};
				class Mission_Conditions {
					text = "Conditions";
					data = "Conditions";
				};
				class Mission_End {
					text = "End";
					data = "EndMission";
				};

				class Select {
					text = "Select";
					items[] = {
						"Select_All",
						"Select_Players",
						"Select_AI",
						"Select_Side"
					};
				};
				class Select_All {
					text = "All";
					data = "SelectAll";
				};
				class Select_Players {
					text = "Players";
					data = "SelectPlayers";
				};
				class Select_AI {
					text = "AI";
					data = "SelectAI";
				};
				class Select_Side {
					text = "Side";
					items[] = {
						"Select_Side_West",
						"Select_Side_East",
						"Select_Side_Guer",
						"Select_Side_Civ"
					};
				};
				class Select_Side_West {
					text = "West";
					data = "SelectWest";
				};
				class Select_Side_East {
					text = "East";
					data = "SelectEast";
				};
				class Select_Side_Guer {
					text = "Guer";
					data = "SelectGuer";
				};
				class Select_Side_Civ {
					text = "Civ";
					data = "SelectCiv";
				};
				class Utility {
					text = "Utility";
					items[] = {
						"Utility_DeleteDead",
						"Utility_Cleanup",
						"Utility_TFAR"
					};
				};
				class Utility_DeleteDead {
					text = "Delete Dead";
					data = "DeleteDead";
				};
				class Utility_Cleanup {
					text = "Cleanup";
					data = "Cleanup";
					tooltip = "Deletes dropped weapons, items, craters, ...";
				};
				class Utility_TFAR {
					text = "TFAR";
					items[] = {
						"Utility_TFAR_CuratorCamEars",
						"Utility_TFAR_SpecFix"
					};

					BRM_FMK_RHEA_enable = QUOTE(HAS_ADDON('tfar_core'));
				};
				class Utility_TFAR_CuratorCamEars {
					text = "Curator Camera Ears";
					data = "CuratorCamEars";
					tooltip = "Toggle hearing of units from Curator camera.";
					type = "CheckBox";
					default = "false";

					BRM_FMK_RHEA_checked = "TFAR_curatorCamEars";
				};
				class Utility_TFAR_SpecFix { // In-case someone manually enters Spectator.
					text = "Spectator Fix";
					data = "TFARSpecFix";
					tooltip = "Fix players that cannot be heard locally, but can be heard via radio";
				};
				class Separator {};
				class Default {
					text="$STR_3DEN_Display3DEN_MenuBar_Default_text";
					enable=0;
				};
			};
		};
	};
}