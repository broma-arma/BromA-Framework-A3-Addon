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
			file = "\broma_framework\plugins\ace3_plugin\functions";
			CFGFNC(postInit);
		};
		class Functions {
			file = "\broma_framework\plugins\ace3_plugin\functions";
			CFGFNC(ACE_RevivePlayer);
			CFGFNC(addACEHelp);
		};
	};

};

class BRM_FMK_Plugins {
	class ace3_plugin {
		name = "ACE3 Plugin";
		version = 1;
		authors[] = {"nigel"};
		description = "Allows for the easy configuration of the ACE3 mod settings, including the Medical system and other modules.";
		postInit[] = {QFUNC(postInit)};
	};
};
