#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "Vanilla Spectator System";
		authors[] = { "Bohemia Interactive", "Nife" };
		description = "This plugin enables compatibility with the vanilla spectator system.";
		conflict_plugins[] = { "ace3_spectator" };

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	vanilla_spectator = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\vanilla_spectator\functions";

			CFGFNC(preInit);
		};

		class Functions {
			file = "\broma_framework\plugins\vanilla_spectator\functions";

			CFGFNC(getSettings);
			CFGFNC(centerOnTarget);
		};
	};
};
