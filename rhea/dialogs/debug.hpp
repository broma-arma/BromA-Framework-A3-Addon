class BRM_FMK_RHEA_debug {
	idd = -1;
	onLoad = "['onLoad', _this] call BRM_FMK_RHEA_fnc_debug";
	onUnload = "['onUnload', _this] call BRM_FMK_RHEA_fnc_debug";
	class ControlsBackground {
		class DebugBackground: IGUIBack {
			idc = -1;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 13 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		class Title: RscText {
			idc = -1;
			text = "Debug"; //--- ToDo: Localize;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 15.5 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			colorBackground[] = GUI_BCG_COLOR;
		};
		class ExpressionFrame: RscFrame {
			idc = -1;
			text = "Execute"; //--- ToDo: Localize;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 6.8 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 8.7 * GUI_GRID_H;
		};
		class WatchFrame: RscFrame {
			idc = -1;
			text = "Watch"; //--- ToDo: Localize;
			x = 12 * GUI_GRID_W + GUI_GRID_X;
			y = 15.7 * GUI_GRID_H + GUI_GRID_Y;
			w = 16 * GUI_GRID_W;
			h = 3.4 * GUI_GRID_H;
		};
	};
	class Controls {
		class Expression: RscEdit {
			idc = 1400;
			style = ST_MULTI;
			autocomplete = "scripting";
			font = "EtelkaMonospacePro";
			x = 12.1 * GUI_GRID_W + GUI_GRID_X;
			y = 7.1 * GUI_GRID_H + GUI_GRID_Y;
			w = 15.8 * GUI_GRID_W;
			h = 7.7 * GUI_GRID_H;
			//sizeEx = "0.7 * GUI_GRID_H";
			sizeEx = "0.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class ButtonExecuteLocal: RscButtonMenu {
			idc = 2401;
			text = "LOCAL";
			onButtonClick = "['executeButton', [0] + _this] call BRM_FMK_RHEA_fnc_debug;";
			x = 24.1 * GUI_GRID_W + GUI_GRID_X;
			y = 14.9 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.8 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
		};
		class ButtonExecuteGlobal: RscButtonMenu {
			idc = 2402;
			text = "GLOBAL";
			onButtonClick = "['executeButton', [1] + _this] call BRM_FMK_RHEA_fnc_debug;";
			x = 12.1 * GUI_GRID_W + GUI_GRID_X;
			y = 14.9 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.8 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
		};
		class ButtonExecuteServer: RscButtonMenu {
			idc = 2403;
			text = "SERVER";
			onButtonClick = "['executeButton', [2] + _this] call BRM_FMK_RHEA_fnc_debug;";
			x = 20.1 * GUI_GRID_W + GUI_GRID_X;
			y = 14.9 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.9 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
		};
		class ButtonExecuteClient: RscButtonMenu {
			idc = 2404;
			text = "CLIENT";
			onButtonClick = "['executeButton', [3] + _this] call BRM_FMK_RHEA_fnc_debug;";
			x = 16 * GUI_GRID_W + GUI_GRID_X;
			y = 14.9 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.9 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
		};
		class ButtonClose: RscButtonMenuCancel {
			idc = 2400;
			text = "X";
			onButtonClick = "closeDialog 2;";
			x = 27.5 * GUI_GRID_W + GUI_GRID_X;
			y = 6 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.5 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
		};
		class WatchInput1: RscEdit {
			idc = 1401;
			autocomplete = "scripting";
			font = "EtelkaMonospacePro";
			x = 12.1 * GUI_GRID_W + GUI_GRID_X;
			y = 16 * GUI_GRID_H + GUI_GRID_Y;
			w = 7.3 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			//sizeEx = "0.7 * GUI_GRID_H";
			sizeEx = "0.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class WatchInput2: WatchInput1 {
			idc = 1402;
			y = 16.6 * GUI_GRID_H + GUI_GRID_Y;
		};
		class WatchInput3: WatchInput1 {
			idc = 1403;
			y = 17.2 * GUI_GRID_H + GUI_GRID_Y;
		};
		class WatchInput4: WatchInput1 {
			idc = 1404;
			y = 17.8 * GUI_GRID_H + GUI_GRID_Y;
		};
		class WatchInput5: WatchInput1 {
			idc = 1405;
			y = 18.4 * GUI_GRID_H + GUI_GRID_Y;
		};
		class WatchOutput1: RscEdit {
			idc = 1406;
			lineSpacing = 1;
			style = ST_NO_RECT;
			font = "EtelkaMonospacePro";
			colorBackground[] = {0,0,0,0.75};
			x = 19.6 * GUI_GRID_W + GUI_GRID_X;
			y = 16 * GUI_GRID_H + GUI_GRID_Y;
			w = 8.3 * GUI_GRID_W;
			h = 0.5 * GUI_GRID_H;
			//sizeEx = "0.7 * (safezoneH / 25)";
			sizeEx = "0.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class WatchOutput2: WatchOutput1 {
			idc = 1407;
			y = 16.6 * GUI_GRID_H + GUI_GRID_Y;
		};
		class WatchOutput3: WatchOutput1 {
			idc = 1408;
			y = 17.2 * GUI_GRID_H + GUI_GRID_Y;
		};
		class WatchOutput4: WatchOutput1 {
			idc = 1409;
			y = 17.8 * GUI_GRID_H + GUI_GRID_Y;
		};
		class WatchOutput5: WatchOutput1 {
			idc = 1410;
			y = 18.4 * GUI_GRID_H + GUI_GRID_Y;
		};
	};
};