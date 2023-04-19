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
		class init {
			file = "\broma_framework\plugins\sync_status\functions";
			CFGFNC(postInit);
		};
		class Functions {
			file = "\broma_framework\plugins\sync_status\functions";
			CFGFNC(saveStatus);
			CFGFNC(loadStatus);
			CFGFNC(playerVars);
		};
	};

};

class BRM_FMK_Plugins {
	class sync_status {
		name = "Synchronize Status";
		version = 1;
		authors[] = {"Nife"};
		description = "Constantly sends your current position and over relevant data to the server, and synchronizes it every time you JIP back into the session.";
		postInit[] = {QFUNC(postInit)};
	};
};
