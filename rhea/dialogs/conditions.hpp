class BRM_FMK_RHEA_conditions {
	idd = -1;
	onLoad = "_this call BRM_FMK_RHEA_fnc_initConditions;";
	class ControlsBackground {
		class BG: IGUIBack {
			idc = -1;
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 11 * GUI_GRID_W;
			h = 5.4 * GUI_GRID_H;
			colorBackground[] = {0.05,0.05,0.05,1};
		};
	};
	class Controls {
		class txtTitle: RscText {
			idc = 9036;
			text = "Conditions";
			x = 14.5 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 10.5 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			colorBackground[] = GUI_BCG_COLOR;
		};
		class btnClose: RscButton {
			idc = 9636;
			text = "X";
			x = 25 * GUI_GRID_W + GUI_GRID_X;
			y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.5 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			colorBackground[] = GUI_BCG_COLOR;
			colorBackgroundActive[] = IGUI_ERROR_COLOR;
		};
		class btnOk: RscButtonMenuOK {
			idc = 1600;
			x = 23.6 * GUI_GRID_W + GUI_GRID_X;
			y = 14.1 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.7 * GUI_GRID_W;
			h = 0.6 * GUI_GRID_H;
		};
		class btnCancel: RscButtonMenuCancel {
			idc = 1601;
			x = 21.8 * GUI_GRID_W + GUI_GRID_X;
			y = 14.1 * GUI_GRID_H + GUI_GRID_Y;
			w = 1.7 * GUI_GRID_W;
			h = 0.6 * GUI_GRID_H;
		};
		class txtHour: RscText {
			idc = 9037;
			text = "Hour";
			x = 14.6 * GUI_GRID_W + GUI_GRID_X;
			y = 10 * GUI_GRID_H + GUI_GRID_Y;
			w = 10.8 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
		};
		class sdrHour: RscSlider {
			idc = 9936;
			onSliderPosChanged = "";
			x = 14.6 * GUI_GRID_W + GUI_GRID_X;
			y = 10.6 * GUI_GRID_H + GUI_GRID_Y;
			w = 10.8 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
		};
		class txtRain: RscText {
			idc = 9038;
			text = "Rain & Overcast";
			x = 14.6 * GUI_GRID_W + GUI_GRID_X;
			y = 11.4 * GUI_GRID_H + GUI_GRID_Y;
			w = 10.8 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
		};
		class sdrRain: RscSlider {
			idc = 9937;
			onSliderPosChanged = "";
			x = 14.6 * GUI_GRID_W + GUI_GRID_X;
			y = 12 * GUI_GRID_H + GUI_GRID_Y;
			w = 10.8 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
		};
		class txtFog: RscText {
			idc = 9039;
			text = "Fog";
			x = 14.6 * GUI_GRID_W + GUI_GRID_X;
			y = 12.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 10.8 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
		};
		class sdrFog: RscSlider {
			idc = 9938;
			onSliderPosChanged = "";
			x = 14.6 * GUI_GRID_W + GUI_GRID_X;
			y = 13.4 * GUI_GRID_H + GUI_GRID_Y;
			w = 10.8 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
		};
	};
};