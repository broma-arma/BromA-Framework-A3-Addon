#include "\A3\ui_f\hpp\defineCommonGrids.inc"

class RscControlsGroupNoScrollbars;
class BRM_FMK_Zeus_RscAttributeBase: RscControlsGroupNoScrollbars {
	onLoad = "['onLoad', _this] call BRM_FMK_Zeus_fnc_initCuratorAttribute;";
	onSetFocus = "['onSetFocus', _this] call BRM_FMK_Zeus_fnc_initCuratorAttribute;";
};

class RscDisplayAttributes {
	class Controls {
		class Background;
		class Title;
		class Content;
		class ButtonOK;
		class ButtonCustom;
		class ButtonCancel;
	}
};
class RscText;
class RscCombo;
class RscListBoxMulti;

class BRM_FMK_Zeus_ModuleCargo: RscDisplayAttributes {
	class Controls: Controls {
		class Background: Background {};
		class Title: Title {};
		class Content: Content {
			class Controls: Controls {
				class Cargo: BRM_FMK_Zeus_RscAttributeBase {
					idc = 1010;
					x = 7 * GUI_GRID_W + GUI_GRID_CENTER_X;
					y = 10 * GUI_GRID_H + GUI_GRID_CENTER_Y;
					w = 26 * GUI_GRID_W;
					h = 18 * GUI_GRID_H;
					class Controls {
						class TitleFaction: RscText {
							idc = 1011;
							text = "$STR_disp_arcunit_faction";
							x = 0 * GUI_GRID_W;
							y = 0 * GUI_GRID_H;
							w = 5 * GUI_GRID_W;
							h = 1 * GUI_GRID_H;
							colorBackground[] = {0, 0, 0, 0.5};
						};
						class Faction: RscCombo {
							idc = 1012;
							x = 5 * GUI_GRID_W;
							y = 0 * GUI_GRID_H;
							w = 21 * GUI_GRID_W;
							h = 1 * GUI_GRID_H;
						};
						class Cargo: RscListBoxMulti {
							idc = 1013;
							x = 0 * GUI_GRID_W;
							y = 1.5 * GUI_GRID_H;
							w = 26 * GUI_GRID_W;
							h = 16.5 * GUI_GRID_H;
						};
					};
				};
			};
		};
		class ButtonOK: ButtonOK {};
		class ButtonCancel: ButtonCancel {};
	};
};

class BRM_FMK_Zeus_ModuleLoadout: RscDisplayAttributes {
	class Controls: Controls {
		class Background: Background {};
		class Title: Title {};
		class Content: Content {
			class Controls: Controls {
				class Cargo: BRM_FMK_Zeus_RscAttributeBase {
					idc = 1010;
					x = 7 * GUI_GRID_W + GUI_GRID_CENTER_X;
					y = 10 * GUI_GRID_H + GUI_GRID_CENTER_Y;
					w = 26 * GUI_GRID_W;
					h = 2 * GUI_GRID_H;
					class Controls {
						class TitleFaction: RscText {
							idc = 1011;
							text = "$STR_disp_arcunit_faction";
							x = 0 * GUI_GRID_W;
							y = 0 * GUI_GRID_H;
							w = 5 * GUI_GRID_W;
							h = 1 * GUI_GRID_H;
							colorBackground[] = {0, 0, 0, 0.5};
						};
						class Faction: RscCombo {
							idc = 1012;
							x = 5 * GUI_GRID_W;
							y = 0 * GUI_GRID_H;
							w = 21 * GUI_GRID_W;
							h = 1 * GUI_GRID_H;
						};
						class TitleRole: TitleFaction {
							idc = 1013;
							//text = "$str_a3_rscdisplaymultiplayersetup_title"; // "Role Assignment"
							text = "$str_disp_mprole_roles"; // "Roles:"
							y = 1 * GUI_GRID_H;
						};
						class Role: RscCombo {
							idc = 1014;
							x = 5 * GUI_GRID_W;
							y = 1 * GUI_GRID_H;
							w = 21 * GUI_GRID_W;
							h = 1 * GUI_GRID_H;
						};
					};
				};
			};
		};
		class ButtonOK: ButtonOK {};
		class ButtonCancel: ButtonCancel {};
	};
};
