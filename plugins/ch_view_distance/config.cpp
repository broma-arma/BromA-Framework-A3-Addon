#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgFunctions {
	class ADDON {
		class functions	{
			file = "\broma_framework\plugins\ch_view_distance\functions";
			CFGFNC(getSettings);
			CFGFNC(onSliderChange);
			CFGFNC(onLBSelChanged);
			CFGFNC(onLBSelChanged_syncmode);
			CFGFNC(onEBinput);
			CFGFNC(onEBterrainInput);
			CFGFNC(onEBinput_syncmode);
			CFGFNC(selTerrainQuality);
			CFGFNC(updateTerrain);
			CFGFNC(updateSettings);
			CFGFNC(updateVehType);
			CFGFNC(fovViewDistance);
			CFGFNC(UAVstatus);
			CFGFNC(openDialog);
			CFGFNC(localize);
			CFGFNC(trueZoom);
			CFGFNC(keyBindings);
			CFGFNC(keyDown);
			CFGFNC(keyDownTerrain);
			CFGFNC(postinit);
		};
	};

};

class BRM_FMK_Plugins {
	class ch_view_distance {
		name = "View Distance Settings";
		version = "1.13";
		authors[] = {"Champ"};
		description = "Allows for the player to change their view/object draw distance. Default key is Ctrl + \.";
		postInit[] = {QFUNC(postInit)};
	};
};

#include "dialogs\dialog.hpp"
