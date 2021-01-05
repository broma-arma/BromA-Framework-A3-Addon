#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "Synchronize Status";
		authors[] = { "Nife" };
		description = "Constantly sends your current position and over relevant data to the server, and synchronizes it every time you JIP back into the session.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	sync_status = QUOTE(ADDON);
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
