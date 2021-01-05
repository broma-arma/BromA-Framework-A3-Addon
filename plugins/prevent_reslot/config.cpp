#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "Prevent Reslotting";
		authors[] = { "Nife" };
		description = "As soon enough time has passed, the currently slotted player unit will be locked, blocking any attempts to change it.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	prevent_reslot = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\prevent_reslot\functions";

			CFGFNC(postInit);
		};
	};
};
