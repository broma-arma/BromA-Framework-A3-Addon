class BRM_FMK_RHEA_login {
	idd = -1;
	onLoad = "uiNamespace setVariable ['BRM_FMK_RHEA_loginDialog', _this select 0]; ctrlSetFocus ((_this select 0) displayCtrl 1400);";
	onUnload = "uiNamespace setVariable ['BRM_FMK_RHEA_loginDialog', nil]";

	class ControlsBackground {
		class background: IGUIBack {
			idc = -1;
			x = 16.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 7 * GUI_GRID_W;
			h = 3.5 * GUI_GRID_H;
			colorBackground[] = {0.05,0.05,0.05,1};
		};
		class txtTitle: RscText {
			idc = -1;
			text = "RHEA - Login";
			x = 16.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			colorBackground[] = GUI_BCG_COLOR;
		};
		class txtError: RscText {
			idc = 1006;
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			colorText[] = IGUI_ERROR_COLOR;
		};
	};
	class Controls {
		class btnClose: RscButton {
			idc = 1600;
			action = "(uiNamespace getVariable ['BRM_FMK_RHEA_loginDialog', displayNull]) closeDisplay 0;";
			text = "X";
			x = 23 * GUI_GRID_W + GUI_GRID_X;
			y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.5 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			colorBackground[] = GUI_BCG_COLOR;
			colorBackgroundActive[] = IGUI_ERROR_COLOR;
		};
		class btnLogin: RscButton {
			idc = 1601;
			onButtonClick = "ctrlParent (_this select 0) call BRM_FMK_RHEA_fnc_login;";
			text = "Login";
			x = 19 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 2 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
		};
		class txtPass: RscEdit {
			idc = 1400;
			onKeyDown="params ['_control', '_key', '_shift', '_ctrl', '_alt']; if (_key == 28 || _key == 156) then { ctrlParent _control call BRM_FMK_RHEA_fnc_login; };";
			x = 17 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 6 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
		};
	};
};