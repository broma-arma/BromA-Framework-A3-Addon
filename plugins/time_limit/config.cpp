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
			file = "\broma_framework\plugins\time_limit\functions";
			CFGFNC(postinit);
		};

		class Functions {
			file = "\broma_framework\plugins\time_limit\functions";
			CFGFNC(getSettings);
			CFGFNC(addTime);
			CFGFNC(removeTime);
		};
	};

};

class BRM_FMK_Plugins {
	class time_limit {
		name = "Time limit";
		version = 1;
		authors[] = {"Nife"};
		description = "Ends the mission after a parameter set amount of time has passed, and based on mission settings alerts the player on relevant times to the mission maker.";
		postInit[] = {QFUNC(postInit)};
	};
};
