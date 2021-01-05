#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "ACE3 Spectator plugin";
		authors[] = { "Nife" };
		description = "Manages some stuff about the spectator system.";
		conflict_plugins[] = { "vanilla_spectator" };

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	ace3_spectator = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\ace3_spectator\functions";

			CFGFNC(postinit);
		};
	};
};
