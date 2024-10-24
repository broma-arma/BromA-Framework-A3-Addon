class CfgPatches {
	class BRM_FMK_3DEN {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = {"3DEN", "BRM_FRAMEWORK"};
	};
};

class CfgFunctions {
	class BRM_FMK_3DEN {
		class loadoutViewer {
			file = "\broma_framework\3den\loadoutViewer";
			class loadoutViewer {};
			class preprocessStringComments {};
		};
	};
};

class ctrlMenuStrip;
class Display3DEN {
	class Controls {
		class MenuStrip: ctrlMenuStrip {
			class Items {
				class Tools {
					items[] += {"BRM_FMK_3DEN"};
				};
				class BRM_FMK_3DEN {
					text = "BromA Framework";
					items[] = {"BRM_FMK_3DEN_LoadoutViewer"};
				};
				class BRM_FMK_3DEN_LoadoutViewer {
					text = "Loadout Viewer";
					action = "[] call BRM_FMK_3DEN_fnc_loadoutViewer;";
				};
			};
		};
	};
};

class ctrlButton;
class ctrlButtonCancel;
class ctrlButtonPicture;
class ctrlControlsGroupNoScrollbars;
class ctrlEditMulti;
class ctrlListbox;
class ctrlStatic;
class ctrlStaticBackground;
class ctrlStaticBackgroundDisable;
class ctrlStaticBackgroundDisableTiles;
class ctrlStaticFooter;
class ctrlStaticMulti;
class ctrlStaticTitle;

#include "\a3\3DEN\UI\macros.inc"
#include "\a3\3DEN\UI\macroexecs.inc"
//#include "\a3\3DEN\UI\dikcodes.inc"
//#include "\a3\3DEN\UI\resincl.inc"

#include "loadoutViewer\ui.hpp"
