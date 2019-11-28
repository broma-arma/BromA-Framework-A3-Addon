#include "../defines.hpp"

//#include "\A3\3den\ui\dikcodes.inc"
//#include "\A3\3den\ui\macroexecs.inc"
#include "\A3\3den\ui\macros.inc"
#include "\A3\3den\ui\resincl.inc"

class ctrlStatic;
class ctrlMenuStrip;
class ctrlControlsGroup;
class ctrlEdit;
class ctrlButtonPicture;
class ctrlCombo;
class ctrlListbox;
class ctrlButton;
class tabAnimationSources;
class ctrlCheckBox;
class leftContent;
class ctrlStaticBackground;
class ctrlStaticTitle;
class ctrlControlsGroupNoScrollbars;
class ctrlShortcutButtonOK;
class ctrlShortcutButtonCancel;
class ctrlButtonPictureKeepAspect;

class MPDisplayGarage {
	idd = -1;
	onLoad = "(['Load'] + _this) call BRM_FMK_MPGarage_fnc_onGarageEvent;";
	onUnload = "(['Unload'] + _this) call BRM_FMK_MPGarage_fnc_onGarageEvent;";

	class ControlsBackground {
		class MouseArea: ctrlStatic {
			idc = IDC_MPG_MOUSEAREA;
			x = GUI_PIXEL_GRID_X;
			y = GUI_PIXEL_GRID_Y;
			w = GUI_PIXEL_GRID_WAbs;
			h = GUI_PIXEL_GRID_HAbs;
			style = ST_MULTI;
		};

		class leftTabsBackground: ctrlStatic {
			idc = IDC_MPG_LEFTTABSBACKGROUND;
			x = GUI_ANCHOR_LEFT(GUI_PIXEL_GRID_W * 0);
			y = GUI_ANCHOR_TOP(SIZE_EX * GUI_PIXEL_GRID_H);
			w = PANEL_WIDTH;
			h = SIZE_EX * 2 * GUI_PIXEL_GRID_H;

			colorBackground[] = {COLOR_BACKGROUND_RGBA};
		};
		class rightTabsBackground: leftTabsBackground {
			idc = IDC_MPG_RIGHTTABSBACKGROUND;
			x = GUI_ANCHOR_RIGHT(PANEL_WIDTH);
		};
		class pylonConfigBackground: rightTabsBackground {
			idc = IDC_MPG_PYLONCONFIG_BACKGROUND;
			h = SIZE_EX * 3 * GUI_PIXEL_GRID_H;
		};

		class tabLeftBackground: ctrlStatic {
			idc = IDC_MPG_TABLEFTBACKGROUND;
			x = GUI_ANCHOR_LEFT(GUI_PIXEL_GRID_W * 1);
			y = GUI_ANCHOR_TOP(SIZE_EX * GUI_PIXEL_GRID_H);
			w = 2 * GUI_PIXEL_GRID_W;
			h = SIZE_EX * 2 * GUI_PIXEL_GRID_H;

			colorBackground[] = {COLOR_ACTIVE_RGBA};
		};
		class tabRightBackground: tabLeftBackground {
			idc = IDC_MPG_TABRIGHTBACKGROUND;
			x = GUI_ANCHOR_RIGHT(PANEL_WIDTH);
		};
    };
    class Controls {
		class Menu: ctrlMenuStrip {
			idc=IDC_MPG_MENU;
			x = GUI_ANCHOR_LEFT(GUI_PIXEL_GRID_W * 0);
			y = GUI_ANCHOR_TOP(GUI_PIXEL_GRID_H * 0);
			w = GUI_ANCHOR_RIGHT(GUI_ANCHOR_LEFT(GUI_PIXEL_GRID_W * 0));
			h = SIZE_EX * GUI_PIXEL_GRID_H;

			sizeEx = SIZE_EX * GUI_PIXEL_GRID_H;

			class Items {
				items[] = {
					"File"
				};
				class File {
					text = "File";
					items[] = {
						"FileOpen",
						"FileSave",
						"FileRandom",
						"Separator",
						"FileExit"
					};
				};
				class FileOpen {
					text = "Open";
					data = "FileOpen";
					picture="\a3\3den\data\displays\display3den\toolbar\open_ca.paa";
				};
				class FileSave {
					text = "Save";
					data = "FileSave";
					picture="\a3\3den\data\displays\display3den\toolbar\save_ca.paa";
				};
				class FileRandom {
					text = "Random";
					data = "FileRandom";
				};
				class FileExit {
					text = "Exit";
					data = "FileExit";
				};
				class Separator {};
				class Default {
					text="$STR_3DEN_Display3DEN_MenuBar_Default_text";
					enable=0;
				};
			};
		};

		class leftTabs: ctrlControlsGroup {
			idc = IDC_MPG_LEFTTABS;
			text = "leftTabs";
			x = GUI_ANCHOR_LEFT(GUI_PIXEL_GRID_W * 0);
			y = GUI_ANCHOR_TOP(SIZE_EX * GUI_PIXEL_GRID_H);
			w = PANEL_WIDTH;
			h = SIZE_EX * 2 * GUI_PIXEL_GRID_H;

			class Controls {
				class tabCar: ctrlButton {
					onButtonClick = "[ctrlParent (_this select 0), _this select 0] call BRM_FMK_MPGarage_fnc_onLeftTabSelect;";

					colorBackground[] = {COLOR_OVERLAY_RGB, 0.25};

					idc = IDC_MPG_TABCAR;
					x = ((PANEL_WIDTH - (PANEL_WIDTH / 6 - 0.5 * GUI_PIXEL_GRID_W) * 6) / (6 + 1));
					y = SIZE_EX * 0.125 * GUI_PIXEL_GRID_H;
					w = PANEL_WIDTH / 6 - 0.5 * GUI_PIXEL_GRID_W;
					h = SIZE_EX * 1.75 * GUI_PIXEL_GRID_H;
					style = ST_PICTURE + ST_KEEP_ASPECT_RATIO;
					text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGarage\Car_ca.paa";
				};
				class tabTank: tabCar {
					idc = IDC_MPG_TABTANK;
					x = ((PANEL_WIDTH - (PANEL_WIDTH / 6 - 0.5 * GUI_PIXEL_GRID_W) * 6) / (6 + 1)) * 2 + (PANEL_WIDTH / 6 - 0.5 * GUI_PIXEL_GRID_W) * 1;
					text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGarage\Tank_ca.paa";
				};
				class tabHelicopter: tabCar {
					idc = IDC_MPG_TABHELICOPTER;
					x = ((PANEL_WIDTH - (PANEL_WIDTH / 6 - 0.5 * GUI_PIXEL_GRID_W) * 6) / (6 + 1)) * 3 + (PANEL_WIDTH / 6 - 0.5 * GUI_PIXEL_GRID_W) * 2;
					text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGarage\Helicopter_ca.paa";
				};
				class tabPlane: tabCar {
					idc = IDC_MPG_TABPLANE;
					x = ((PANEL_WIDTH - (PANEL_WIDTH / 6 - 0.5 * GUI_PIXEL_GRID_W) * 6) / (6 + 1)) * 4 + (PANEL_WIDTH / 6 - 0.5 * GUI_PIXEL_GRID_W) * 3;
					text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGarage\Plane_ca.paa";
				};
				class tabNaval: tabCar {
					idc = IDC_MPG_TABNAVAL;
					x = ((PANEL_WIDTH - (PANEL_WIDTH / 6 - 0.5 * GUI_PIXEL_GRID_W) * 6) / (6 + 1)) * 5 + (PANEL_WIDTH / 6 - 0.5 * GUI_PIXEL_GRID_W) * 4;
					text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGarage\Naval_ca.paa";
				};
				class tabStatic: tabCar {
					idc = IDC_MPG_TABSTATIC;
					x = ((PANEL_WIDTH - (PANEL_WIDTH / 6 - 0.5 * GUI_PIXEL_GRID_W) * 6) / (6 + 1)) * 6 + (PANEL_WIDTH / 6 - 0.5 * GUI_PIXEL_GRID_W) * 5;
					text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGarage\Static_ca.paa";
				};
			};
		};
		class leftSearch: ctrlEdit {
			onMouseButtonClick = "if (_this select 1 == 1) then { _this select 0 ctrlSetText ''; ctrlSetFocus (_this select 0); };";
			onKeyDown = "params ['_control', '_key', '_shift', '_ctrl', '_alt']; if (_key == 28 || _key == 156) then { [ctrlParent _control, _control] call BRM_FMK_MPGarage_fnc_onSearch; true }; false";

			idc = IDC_MPG_LEFTSEARCH;
			x = GUI_ANCHOR_LEFT(GUI_PIXEL_GRID_W * 0);
			y = GUI_ANCHOR_TOP(SIZE_EX * GUI_PIXEL_GRID_H * 3);
			w = PANEL_WIDTH - (GUI_PIXEL_GRID_W * SIZE_EX);
			h = SIZE_EX * GUI_PIXEL_GRID_H;

			style = ST_NO_RECT;

			colorBackground[]={COLOR_TAB_RGBA};

			sizeEx = SIZE_EX * GUI_PIXEL_GRID_H;
		};
		class leftSearchButton: ctrlButtonPicture {
			onButtonClick = "[ctrlParent (_this select 0), _this select 0] call BRM_FMK_MPGarage_fnc_onSearch;";

			idc = IDC_MPG_LEFTSEARCHBUTTON;
			x = GUI_ANCHOR_LEFT(PANEL_WIDTH - GUI_PIXEL_GRID_W * SIZE_EX);
			y = GUI_ANCHOR_TOP(SIZE_EX * GUI_PIXEL_GRID_H * 3);
			w = SIZE_EX * GUI_PIXEL_GRID_W;
			h = SIZE_EX * GUI_PIXEL_GRID_H;

			colorBackground[] = {COLOR_TAB_RGBA};

			text = "\a3\3den\data\displays\display3den\search_start_ca.paa";
		};
		class leftSort: ctrlCombo {
			idc = IDC_MPG_LEFTSORT;
			x = GUI_ANCHOR_LEFT(GUI_PIXEL_GRID_W * 0);
			y = GUI_ANCHOR_TOP(SIZE_EX * GUI_PIXEL_GRID_H * 4);
			w = PANEL_WIDTH;
			h = SIZE_EX * GUI_PIXEL_GRID_H;

			onLBSelChanged = "[ctrlParent (_this select 0)] + _this call BRM_FMK_MPGarage_fnc_onLeftSortChanged;";

			sizeEx = SIZE_EX * GUI_PIXEL_GRID_H;

			class Items {
				class Alphabet {
					text="$STR_a3_rscdisplayarsenal_sort_alphabet";
					default=1;
				};
				class Mod {
					text="$STR_a3_rscdisplayarsenal_sort_mod";
				};
			};
		};
		class leftContent: ctrlListbox {
			onLBSelChanged = "[ctrlParent (_this select 0)] + _this call BRM_FMK_MPGarage_fnc_onLeftListSelected;";

			idc = IDC_MPG_LEFTCONTENT;
			x = GUI_ANCHOR_LEFT(GUI_PIXEL_GRID_W * 0);
			y = GUI_ANCHOR_TOP(SIZE_EX * GUI_PIXEL_GRID_H * 5);
			w = PANEL_WIDTH;
			h = GUI_ANCHOR_BOTTOM(GUI_ANCHOR_TOP(SIZE_EX * GUI_PIXEL_GRID_H * 5));

			sizeEx = SIZE_EX * GUI_PIXEL_GRID_H;
		};

		class rightTabs: leftTabs {
			idc = IDC_MPG_RIGHTTABS;
			x = GUI_ANCHOR_RIGHT(PANEL_WIDTH);

			class Controls {
				class tabAnimationSources: ctrlButton {
					onButtonClick = "[ctrlParent (_this select 0), _this select 0] call BRM_FMK_MPGarage_fnc_onRightTabSelect;";

					colorBackground[] = {COLOR_OVERLAY_RGB, 0.25};

					idc = IDC_MPG_TABANIMATIONSOURCES;
					x = ((PANEL_WIDTH - (PANEL_WIDTH / 2 - 0.5 * GUI_PIXEL_GRID_W) * 2) / (2 + 1));
					y = SIZE_EX * 0.125 * GUI_PIXEL_GRID_H;
					w = PANEL_WIDTH / 2 - 0.5 * GUI_PIXEL_GRID_W;
					h = SIZE_EX * 1.75 * GUI_PIXEL_GRID_H;
					style = ST_PICTURE + ST_KEEP_ASPECT_RATIO;
					text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGarage\AnimationSources_ca.paa";
				};
				class tabTextureSources: tabAnimationSources {
					idc = IDC_MPG_TABTEXTURESOURCES;
					x = ((PANEL_WIDTH - (PANEL_WIDTH / 2 - 0.5 * GUI_PIXEL_GRID_W) * 2) / (2 + 1)) * 2 + (PANEL_WIDTH / 2 - 0.5 * GUI_PIXEL_GRID_W) * 1;
					text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGarage\TextureSources_ca.paa";
				};
			};
		};
		class pylonConfig: rightTabs {
			idc = IDC_MPG_PYLONCONFIG;

			h = SIZE_EX * 3 * GUI_PIXEL_GRID_H;

			show = 0;

			class Controls {
				class ownerCombo: ctrlCombo {
					onLBSelChanged = "['OwnerChanged', ctrlParent (_this select 0)] + _this call BRM_FMK_MPGarage_fnc_onPylonConfigChanged;";

					idc = IDC_MPG_PYLONCONFIG_OWNER;

					colorBackground[] = {0, 0, 0, 0.3};

					x = SIZE_EX * 0.125 * GUI_PIXEL_GRID_W;
					y = SIZE_EX * 0.125 * GUI_PIXEL_GRID_H;
					w = PANEL_WIDTH - 0.5 * GUI_PIXEL_GRID_W;
					h = SIZE_EX * GUI_PIXEL_GRID_H;

					sizeEx = SIZE_EX * GUI_PIXEL_GRID_H;
				};
				class priorityText : ctrlStatic {
					colorText[] = {1, 1, 1, 0.25};

					style = ST_CENTER;

					x = SIZE_EX * 0.125 * GUI_PIXEL_GRID_W;
					y = SIZE_EX * 1.25 * GUI_PIXEL_GRID_H;
					w = PANEL_WIDTH * 0.25;
					h = SIZE_EX * GUI_PIXEL_GRID_H;

					text = "Priority";

					sizeEx = SIZE_EX * GUI_PIXEL_GRID_H;
				};
				class priorityEdit : ctrlEdit {
					onKeyDown = "['PriorityChanged', ctrlParent (_this select 0)] + _this call BRM_FMK_MPGarage_fnc_onPylonConfigChanged;";
					onKeyUp = "['PriorityChanged', ctrlParent (_this select 0)] + _this call BRM_FMK_MPGarage_fnc_onPylonConfigChanged;";

					idc = IDC_MPG_PYLONCONFIG_PRIORITY;

					style = ST_NO_RECT;

					colorBackground[] = {0, 0, 0, 0.3};

					x = SIZE_EX * 0.125 * GUI_PIXEL_GRID_W;
					y = SIZE_EX * 1.25 * GUI_PIXEL_GRID_H;
					w = PANEL_WIDTH * 0.25;
					h = SIZE_EX * GUI_PIXEL_GRID_H;

					tooltip = "Priority of the selected pylon";

					sizeEx = SIZE_EX * GUI_PIXEL_GRID_H;
				};
				class mirrorCheckbox: ctrlCheckBox {
					onCheckedChanged = "['MirrorChanged', ctrlParent (_this select 0)] + _this call BRM_FMK_MPGarage_fnc_onPylonConfigChanged;";

					idc = IDC_MPG_PYLONCONFIG_MIRROR;

					x = SIZE_EX * 0.25 * GUI_PIXEL_GRID_W + PANEL_WIDTH * 0.25;
					y = SIZE_EX * 1.25 * GUI_PIXEL_GRID_H;
					w = SIZE_EX * GUI_PIXEL_GRID_W;
					h = SIZE_EX * GUI_PIXEL_GRID_H;

					tooltip = "Mirror munitions to the opposite side";

					colorBackground[] = {0,0,0,0.3};
				};
				class mirrorText: ctrlStatic {
					x = SIZE_EX * 1.25 * GUI_PIXEL_GRID_W + PANEL_WIDTH * 0.25;
					y = SIZE_EX * 1.25 * GUI_PIXEL_GRID_H;
					w = PANEL_WIDTH * 0.75 - SIZE_EX * 1.375 * GUI_PIXEL_GRID_W;
					h = SIZE_EX * GUI_PIXEL_GRID_H;

					text = "Mirror";

					colorBackground[] = {0,0,0,0.3};
				};
			};
		};
		class rightSearch: leftSearch {
			idc = IDC_MPG_RIGHTSEARCH;
			x = GUI_ANCHOR_RIGHT(PANEL_WIDTH);
		};
		class rightSearchButton: leftSearchButton {
			idc = IDC_MPG_RIGHTSEARCHBUTTON;
			x = GUI_ANCHOR_RIGHT(GUI_PIXEL_GRID_W * SIZE_EX);
		};
		class rightContent: leftContent {
			onLBSelChanged = "[ctrlParent (_this select 0)] + _this call BRM_FMK_MPGarage_fnc_onRightListSelected;";

			idc = IDC_MPG_RIGHTCONTENT;
			x = GUI_ANCHOR_RIGHT(PANEL_WIDTH);
			y = GUI_ANCHOR_TOP(SIZE_EX * GUI_PIXEL_GRID_H * 4.125);
			h = GUI_ANCHOR_BOTTOM(GUI_ANCHOR_TOP(SIZE_EX * GUI_PIXEL_GRID_H * 5.75));
		};

		class okButton: ctrlButton {
			onButtonClick = "(['OKClicked'] + _this) call BRM_FMK_MPGarage_fnc_onGarageEvent;";

			idc = IDC_MPG_OKBUTTON;
			x = GUI_ANCHOR_RIGHT(PANEL_WIDTH);
			y = GUI_ANCHOR_BOTTOM(SIZE_EX * GUI_PIXEL_GRID_H * 1.5 + GUI_PIXEL_GRID_H * 0.125);
			w = PANEL_WIDTH;
			h = SIZE_EX * 1.5 * GUI_PIXEL_GRID_H;

			//colorBackground[] = {0, 0, 0, 0.5};

			text = "OK";
		};
	};
};

class MPDisplayGarage_Saves {
	idd = -1;

	onLoad = "['Load'] + _this call BRM_FMK_MPGarage_fnc_onSavesEvent;";
	onUnload = "['Unload'] + _this call BRM_FMK_MPGarage_fnc_onSavesEvent;";

	class ControlsBackground {
		class Background: ctrlStaticBackground {
			idc = IDC_MPG_SAVES_BACKGROUND;
			x = 0.5 - (GUI_PIXEL_GRID_WAbs * 0.35) / 2;
			y = 0.5 - (GUI_PIXEL_GRID_HAbs * 0.25) / 2 - GUI_PIXEL_GRID_HAbs * 0.0125;
			w = GUI_PIXEL_GRID_WAbs * 0.35;
			h = GUI_PIXEL_GRID_HAbs * 0.25;
		};
	};
    class Controls {
		class Title: ctrlStaticTitle {
			idc = IDC_MPG_SAVES_TITLE;
			x = 0.5 - (GUI_PIXEL_GRID_WAbs * 0.35) / 2;
			y = 0.5 - (GUI_PIXEL_GRID_HAbs * 0.25) / 2 - GUI_PIXEL_GRID_HAbs * 0.0125;
			w = GUI_PIXEL_GRID_WAbs * 0.35;
			h = GUI_PIXEL_GRID_HAbs * 0.025;

			text = "Saves";
			sizeEx = SIZE_EX * GUI_PIXEL_GRID_H;
		};
		class Group: ctrlControlsGroupNoScrollbars {
			idc = IDC_MPG_SAVES_GROUP;
			x = 0.5 - (GUI_PIXEL_GRID_WAbs * 0.35) / 2;
			y = 0.5 - (GUI_PIXEL_GRID_HAbs * 0.25) / 2 + GUI_PIXEL_GRID_HAbs * 0.0125;
			w = GUI_PIXEL_GRID_WAbs * 0.35;
			h = GUI_PIXEL_GRID_HAbs * 0.225;

			class Controls {
				class List: ctrlListbox {
					onLBSelChanged = "['SaveSelected', ctrlParent (_this select 0)] + _this call BRM_FMK_MPGarage_fnc_onSavesEvent;";

					idc = IDC_MPG_SAVES_LIST;
					x = 0.125 * SIZE_EX * GUI_PIXEL_GRID_W;
					y = 0.125 * SIZE_EX * GUI_PIXEL_GRID_H;
					w = GUI_PIXEL_GRID_WAbs * 0.35 - SIZE_EX * 0.25 * GUI_PIXEL_GRID_W;
					h = GUI_PIXEL_GRID_HAbs * 0.225 - 2.5 * SIZE_EX * GUI_PIXEL_GRID_H;

					sizeEx = SIZE_EX * GUI_PIXEL_GRID_H;
				};
				class Name: ctrlEdit {
					idc = IDC_MPG_SAVES_NAME;
					x = 0.125 * SIZE_EX * GUI_PIXEL_GRID_W;
					y = (GUI_PIXEL_GRID_HAbs * 0.225 - 2.5 * SIZE_EX * GUI_PIXEL_GRID_H) + 0.25 * SIZE_EX * GUI_PIXEL_GRID_H;
					w = GUI_PIXEL_GRID_WAbs * 0.35 - SIZE_EX * 0.25 * GUI_PIXEL_GRID_W;
					h = SIZE_EX * GUI_PIXEL_GRID_H;

					style = ST_NO_RECT;

					sizeEx = SIZE_EX * GUI_PIXEL_GRID_H;
				};
				class ButtonDelete : ctrlButton {
					onButtonClick = "['DeleteClicked', ctrlParent (_this select 0)] + _this call BRM_FMK_MPGarage_fnc_onSavesEvent;";

					x = 0.125 * SIZE_EX * GUI_PIXEL_GRID_H;
					y = (GUI_PIXEL_GRID_HAbs * 0.225 - 2.5 * SIZE_EX * GUI_PIXEL_GRID_H) + 1.375 * SIZE_EX * GUI_PIXEL_GRID_H;
					w = (GUI_PIXEL_GRID_WAbs * 0.35 - 0.5 * SIZE_EX * GUI_PIXEL_GRID_H) / 3;
					h = SIZE_EX * GUI_PIXEL_GRID_H;

					text="Delete";
					size = SIZE_EX * GUI_PIXEL_GRID_H;
				};
				class ButtonOk: ctrlShortcutButtonOK {
					x = (0.125 * SIZE_EX * GUI_PIXEL_GRID_H) * 2 + (GUI_PIXEL_GRID_WAbs * 0.35 - 0.5 * SIZE_EX * GUI_PIXEL_GRID_H) / 3;
					y = (GUI_PIXEL_GRID_HAbs * 0.225 - 2.5 * SIZE_EX * GUI_PIXEL_GRID_H) + 1.375 * SIZE_EX * GUI_PIXEL_GRID_H;
					w = (GUI_PIXEL_GRID_WAbs * 0.35 - 0.5 * SIZE_EX * GUI_PIXEL_GRID_H) / 3;
					h = SIZE_EX * GUI_PIXEL_GRID_H;

					size = SIZE_EX * GUI_PIXEL_GRID_H;
				};
				class ButtonCancel: ctrlShortcutButtonCancel {
					x = (0.125 * SIZE_EX * GUI_PIXEL_GRID_H) * 3 + ((GUI_PIXEL_GRID_WAbs * 0.35 - 0.5 * SIZE_EX * GUI_PIXEL_GRID_H) / 3) * 2;
					y = (GUI_PIXEL_GRID_HAbs * 0.225 - 2.5 * SIZE_EX * GUI_PIXEL_GRID_H) + 1.375 * SIZE_EX * GUI_PIXEL_GRID_H;
					w = (GUI_PIXEL_GRID_WAbs * 0.35 - 0.5 * SIZE_EX * GUI_PIXEL_GRID_H) / 3;
					h = SIZE_EX * GUI_PIXEL_GRID_H;

					size = SIZE_EX * GUI_PIXEL_GRID_H;
				};
			};
		};
	};
};

class ctrlMPGPylonButton: ctrlButtonPictureKeepAspect {
	colorBackground[] = {0, 0, 0, 0};
	colorBackgroundActive[] = {COLOR_ACTIVE_RGB, 0.75};
	colorFocused[] = {COLOR_ACTIVE_RGB, 0.75};
};
