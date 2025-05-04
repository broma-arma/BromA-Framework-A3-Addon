#include "\A3\ui_f\hpp\defineCommonGrids.inc"

class BRM_FMK_RHEA_messagingBase: RscControlsGroupNoScrollbars {
	onLoad = "if ([] call BRM_FMK_RHEA_fnc_isLoggedIn) then { _this select 0 ctrlShow false; };";
	x = safeZoneX + safeZoneW - 16 * GUI_GRID_W;
	y = 15.8 * GUI_GRID_H + GUI_GRID_Y;
	w = 15 * GUI_GRID_W;
	h = 15 * GUI_GRID_H;

	class Controls {
		class Title: RscTitle {
			idc = 1000;
			text = "Message Admin";
			colorBackground[] = GUI_BCG_COLOR;
			x = 0 * GUI_GRID_W;
			y = 0 * GUI_GRID_H;
			w = 15 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class EditBackground: RscText {
			idc = 1001;
			colorBackground[] = GUI_BCG_MENU;
			x = 0 * GUI_GRID_W;
			y = 1.1 * GUI_GRID_H;
			w = 15 * GUI_GRID_W;
			h = 4 * GUI_GRID_H;
		};
		class Edit: RscEditMulti {
			idc = 1002;
			shadow = 0;
			font = "EtelkaMonospacePro";
			onKeyDown = "params [""_control"", ""_key"", ""_shift"", ""_ctrl"", ""_alt""]; if ((_key == 28 || _key == 156) && !(_shift || _ctrl || _alt)) then { [ctrlParentControlsGroup _control] call BRM_FMK_RHEA_fnc_sendMessage; };";
			x = 0.5 * GUI_GRID_W;
			y = 1.6 * GUI_GRID_H;
			w = 14 * GUI_GRID_W;
			h = 3 * GUI_GRID_H;
			sizeEx = 0.75 * GUI_GRID_H;
		};
		class Send: RscButtonMenu {
			idc = 1003;
			text = "SEND";
			onButtonClick = "[ctrlParentControlsGroup (_this select 0)] call BRM_FMK_RHEA_fnc_sendMessage;";
			x = 0 * GUI_GRID_W;
			y = 5.2 * GUI_GRID_H;
			w = 15 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};
};

class RscStandardDisplay;

class RscDisplayInterrupt: RscStandardDisplay {
	class Controls {
		class BRM_FMK_RHEA_messaging: BRM_FMK_RHEA_messagingBase {};
	};
};

class RscDisplayMPInterrupt: RscStandardDisplay {
	class Controls {
		class BRM_FMK_RHEA_messaging: BRM_FMK_RHEA_messagingBase {};
	};
};
