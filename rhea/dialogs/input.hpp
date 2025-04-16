class BRM_FMK_RHEA_input {
	idd = -1;
	onLoad = "uiNamespace setVariable ['BRM_FMK_RHEA_inputDialog_status', nil]; uiNamespace setVariable ['BRM_FMK_RHEA_inputDialog', _this select 0];";
	onUnload = "uiNamespace setVariable ['BRM_FMK_RHEA_inputDialog', nil];";
	onKeyDown = "if ((_this select 1) == 1) then {uiNamespace setVariable ['BRM_FMK_RHEA_inputDialog_status', false]; true} else {false}";
	class ControlsBackground {
		class background: IGUIBack {
			idc = -1;
			x = 16 * GUI_GRID_W + GUI_GRID_X;
			y = 10.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 8 * GUI_GRID_W;
			h = 3.4 * GUI_GRID_H;
			colorBackground[] = {0.05,0.05,0.05,1};
		};
	};
	class Controls {
		class txtTitle: RscText {
			idc = 9036;
			text = "Input";
			x = 16 * GUI_GRID_W + GUI_GRID_X;
			y = 10.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.5 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			colorBackground[] = GUI_BCG_COLOR;
		};
		class btnClose: RscButton {
			idc = 9636;
			text = "X";
			action = "uiNamespace setVariable ['BRM_FMK_RHEA_inputDialog_status', false];";
			x = 23.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.5 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			colorBackground[] = GUI_BCG_COLOR;
			colorBackgroundActive[] = IGUI_ERROR_COLOR;
		};
		class btnOk: RscButtonMenuOK {
			idc = 1600;
			action = "uiNamespace setVariable ['BRM_FMK_RHEA_inputDialog_status', true];";
			x = 22 * GUI_GRID_W + GUI_GRID_X;
			y = 13.6 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.9 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
		};
		class btnCancel: RscButtonMenuCancel {
			idc = 1601;
			action = "uiNamespace setVariable ['BRM_FMK_RHEA_inputDialog_status', false];";
			x = 20 * GUI_GRID_W + GUI_GRID_X;
			y = 13.6 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.9 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
		};
		class stxtMsg: RscStructuredText {
			idc = 9136;
			text = "Enter your input:";
			x = 16.1 * GUI_GRID_W + GUI_GRID_X;
			y = 11.4 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.8 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
		};
		class editBox: RscEdit {
			idc = 9436;
			default = 1;
			x = 16.1 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.8 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
		};
		class cmbBox: RscCombo {
			idc = 10136;
			default = 1;
			fade = 1;
			x = 16.1 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.8 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
		};
	};
};