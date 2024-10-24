#define IDC_LEFTPANELBACKGROUND 1000
#define IDC_MOUSEAREA 1001
#define IDC_TITLE 1002
#define IDC_FACTIONLISTTITLE 1003
#define IDC_FACTIONLIST 1004
#define IDC_CAMOLISTTITLE 1005
#define IDC_CAMOLIST 1006
#define IDC_BUTTONSTRUCTURE 1007
#define IDC_BUTTONMOD 1008
#define IDC_INFOBOX 1009
#define IDC_LAST IDC_INFOBOX

#define IDC_INFOBOX_INFONAME 1100

class BRM_FMK_3DEN_DisplayLoadoutViewer {
	idd=-1;
	onLoad="[""onLoad"", _this] call BRM_FMK_3DEN_fnc_loadoutViewer;";
	onUnload="[""onUnload"", _this] call BRM_FMK_3DEN_fnc_loadoutViewer;";
	onKeyDown="[""KeyDown"", _this] call BRM_FMK_3DEN_fnc_loadoutViewer;";
	onKeyUp="[""KeyUp"", _this] call BRM_FMK_3DEN_fnc_loadoutViewer;";
	class ControlsBackground {
		class LeftPanelBackground: ctrlStaticFooter {
			idc=IDC_LEFTPANELBACKGROUND;
			x=safeZoneX;
			y=safeZoneY + 5 * GRID_H;
			w=60 * GRID_W;
			h=safeZoneH - 5 * GRID_H;
			colorBackground[]={0,0,0,0.5};
		};
		class MouseArea: ctrlStaticMulti {
			idc=IDC_MOUSEAREA;
			x=safeZoneX + 60 * GRID_W;
			y=safeZoneY + 5 * GRID_H;
			w=safeZoneW - 60 * GRID_W;
			h=safeZoneH - 5 * GRID_H;
			onMouseButtonDown="[""onMouseButtonDown"", _this] call BRM_FMK_3DEN_fnc_loadoutViewer;";
			onMouseEnter="[""onMouseEnter"", _this] call BRM_FMK_3DEN_fnc_loadoutViewer;";
			onMouseExit="[""onMouseExit"", _this] call BRM_FMK_3DEN_fnc_loadoutViewer;";
			onMouseButtonDblClick="[""onMouseButtonDblClick"", _this] call BRM_FMK_3DEN_fnc_loadoutViewer;";
		};
	};
	class Controls {
		class Title: ctrlStaticTitle {
			idc=IDC_TITLE;
			text="BromA Framework Loadout Viewer";
			moving=0;
			x=safeZoneX;
			y=safeZoneY;
			w=safeZoneW;
			h=5 * GRID_H;
		};
		class ButtonClose: ctrlButtonPicture {
			idc=2;
			text="\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
			onButtonClick="[""onButtonCloseClick"", _this] call BRM_FMK_3DEN_fnc_loadoutViewer;";
			offsetPressedX=pixelW;
			offsetPressedY=-pixelH;
			x=safezoneX + safezoneW - 5 * GRID_W;
			y=safezoneY;
			w=5 * GRID_W;
			h=5 * GRID_H;
			colorBackground[]={COLOR_ACTIVE_RGB,1};
		};
		class FactionListTitle: ctrlStatic {
			idc=IDC_FACTIONLISTTITLE;
			text="Factions";
			x=safeZoneX;
			y=safeZoneY + 5 * GRID_H;
			w=60 * GRID_W;
			h=5 * GRID_H;
			colorBackground[]={COLOR_ACTIVE_RGB,0.5};
		};
		class FactionList: ctrlListbox {
			idc=IDC_FACTIONLIST;
			onLBSelChanged="[""onFactionLBSelChanged"", _this] call BRM_FMK_3DEN_fnc_loadoutViewer;";
			x=safeZoneX;
			y=safeZoneY + 10 * GRID_H;
			w=60 * GRID_W;
			h=safeZoneH - 40 * GRID_H;
		};
		class CamoListTitle: ctrlStatic {
			idc=IDC_CAMOLISTTITLE;
			text="Camos";
			x=safeZoneX;
			y=safeZoneY + safeZoneH - 30 * GRID_H;
			w=60 * GRID_W;
			h=5 * GRID_H;
			colorBackground[]={COLOR_ACTIVE_RGB,0.5};
		};
		class CamoList: ctrlListbox {
			idc=IDC_CAMOLIST;
			onLBSelChanged="[""onCamoLBSelChanged"", _this] call BRM_FMK_3DEN_fnc_loadoutViewer;";
			x=safeZoneX;
			y=safeZoneY + safeZoneH - 25 * GRID_H;
			w=60 * GRID_W;
			h=safeZoneH - 162 * GRID_H;
		};
		class ButtonStructure: ctrlButton {
			idc=IDC_BUTTONSTRUCTURE;
			text="Structure";
			onButtonClick="[""onButtonStructureClick"", _this] call BRM_FMK_3DEN_fnc_loadoutViewer;";
			x=safeZoneX + 10 * GRID_W;
			y=safeZoneY + safeZoneH - 6 * GRID_H;
			w=20 * GRID_W;
			h=5 * GRID_H;
		};
		class ButtonMod: ctrlButton {
			idc=IDC_BUTTONMOD;
			text="Mod";
			onButtonClick="[""onButtonModClick"", _this] call BRM_FMK_3DEN_fnc_loadoutViewer;";
			x=safeZoneX + 35 * GRID_W;
			y=safeZoneY + safeZoneH - 6 * GRID_H;
			w=15 * GRID_W;
			h=5 * GRID_H;
		};
		class InfoBox: ctrlControlsGroupNoScrollbars {
			idc=IDC_INFOBOX;
			show=0;
			x=safeZoneX + safeZoneW - 45 * GRID_W;
			y=safeZoneH + safeZoneY - 10 * GRID_H;
			w=42 * GRID_W;
			h=5 * GRID_H;
			class Controls {
				class InfoBackground: ctrlStaticBackground {
					x=0 * GRID_W;
					y=0 * GRID_H;
					w=40 * GRID_W;
					h=5 * GRID_H;
					colorBackground[]={0,0,0,0.5};
				};
				class InfoName: ctrlStatic {
					idc=IDC_INFOBOX_INFONAME;
					text="NAME";
					x=0 * GRID_W;
					y=0 * GRID_H;
					w=40 * GRID_W;
					h=5 * GRID_H;
					sizeEx=SIZEEX_PURISTA(SIZEEX_M);
				};
			};
		};
	};
};

#define WINDOW_W 180
#define WINDOW_H 120
class BRM_FMK_3DEN_DialogLoadoutViewerStructure {
	idd=-1;
	onLoad="[""onLoadStructure"", _this] call BRM_FMK_3DEN_fnc_loadoutViewer;";
	onUnload="[""onUnloadStructure"", _this] call BRM_FMK_3DEN_fnc_loadoutViewer;";
	class ControlsBackground {
		class BackgroundDisable: ctrlStaticBackgroundDisable {};
		class BackgroundDisableTiles: ctrlStaticBackgroundDisableTiles {};
		class Background: ctrlStaticBackground {
			x=CENTER_X - (WINDOW_W * 0.5) * GRID_W;
			y=0.5 - (WINDOW_H * 0.5 - 2 * 5) * GRID_H;
			w=WINDOW_W * GRID_W;
			h=(WINDOW_H - 5 - 10) * GRID_H;
		};
	};
	class Controls {
		class Title: ctrlStaticTitle {
			text="Structure";
			moving=0;
			x=CENTER_X - (WINDOW_W * 0.5) * GRID_W;
			y=0.5 - (WINDOW_H * 0.5 - 5) * GRID_H;
			w=WINDOW_W * GRID_W;
			h=5 * GRID_H;
		};
		class EditCode: ctrlEditMulti {
			idc=1000;
			autocomplete="scripting";
			font="EtelkaMonospacePro";
			sizeEx=SIZEEX_ETELKA(SIZE_XS);
			x=CENTER_X - (WINDOW_W * 0.5 - 1) * GRID_W;
			y=0.5 - (WINDOW_H * 0.5 - 11) * GRID_H;
			w=(WINDOW_W - 2) * GRID_W;
			h=((WINDOW_H - 23) * GRID_H);
		};
		class ButtonOk: ctrlButton {
			text="$STR_DISP_OK";
			onButtonClick="[""onStructureButtonOkClick"", _this] call BRM_FMK_3DEN_fnc_loadoutViewer;";
			x=CENTER_X + (WINDOW_W * 0.5 - 55 - 2) * GRID_W;
			y=0.5 + (WINDOW_H * 0.5 - 2 * 5 - 1) * GRID_H;
			w=30 * GRID_W;
			h=5 * GRID_H;
		};
		class ButtonCancel: ctrlButtonCancel {
			x=CENTER_X + (WINDOW_W * 0.5 - 25 - 1) * GRID_W;
			y=0.5 + (WINDOW_H * 0.5 - 2 * 5 - 1) * GRID_H;
			w=25 * GRID_W;
			h=5 * GRID_H;
		};
	};
};

class BRM_FMK_3DEN_DialogLoadoutViewerMod: BRM_FMK_3DEN_DialogLoadoutViewerStructure {
	onLoad="[""onLoadMod"", _this] call BRM_FMK_3DEN_fnc_loadoutViewer;";
	onUnload="[""onUnloadMod"", _this] call BRM_FMK_3DEN_fnc_loadoutViewer;";
	class Controls: Controls {
		class Title: Title {
			text="Faction Mod";
		};
		class EditCode: EditCode {};
		class ButtonOk: ButtonOk {};
		class ButtonCancel: ButtonCancel {};
	};
};
