#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "Automatic body removal";
		authors[] = { "Coryf88" };
		description = "Removes dead bodies after a certain amount of time and distance from players.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	f_remove_body = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\f_remove_body\functions";

			CFGFNC(postinit);
		};

		class Functions {
			file = "\broma_framework\plugins\f_remove_body\functions";

			CFGFNC(removeBody);
		};
	};
};
