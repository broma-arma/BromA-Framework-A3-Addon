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
			file = "\broma_framework\plugins\jip_teleport\functions";
			CFGFNC(postInit);
		};
	};

};

class BRM_FMK_Plugins {
	class jip_teleport {
		name = "JIP teleport";
		version = 1;
		authors[] = {"columdrum", "Nife"};
		description = "Teleports JIPs to their nearest living team-member.";
		postInit[] = {QFUNC(postInit)};
	};
};
