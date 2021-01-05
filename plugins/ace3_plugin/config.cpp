#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "ACE3 Plugin";
		authors[] = { "nigel" };
		description = "Allows for the easy configuration of the ACE3 mod settings, including the Medical system and other modules.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	ace3_plugin = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\ace3_plugin\functions";

			CFGFNC(setParams);
			CFGFNC(postinit);
		};

		class Functions {
			file = "\broma_framework\plugins\ace3_plugin\functions";

			CFGFNC(ACE_RevivePlayer);
			CFGFNC(addACEHelp);
		};
	};
};
