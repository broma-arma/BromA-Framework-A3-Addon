#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "View Distance Settings";
		authors[] = { "Champ" };
		description = "Allows for the player to change their view/object draw distance. Default key is Ctrl + \.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	ch_view_distance = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class functions	{
			file = "\broma_framework\plugins\ch_view_distance\functions";

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

#include "dialogs\dialog.hpp"
