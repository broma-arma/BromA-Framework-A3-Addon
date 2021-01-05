#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "Mission maker tools";
		authors[] = { "Nife" };
		description = "Handy scripts like opening the Arsenal script available to the mission maker while in the editor.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	mission_maker_tools = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\mission_maker_tools\functions";

			CFGFNC(postInit);
		};
	};
};
