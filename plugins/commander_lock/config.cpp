class BRM_FMK {
	class Plugins {
		class commander_lock {
			name = "Commander Lock";
			version = 1;
			authors[] = {"Nife"};
			description = "Forbids players from firing weapons or entering vehicles until the mission Commander gives the all-clear. Compatible with TvT with up to three sides, where all COs need to be ready in order for the mission to begin.";
			tag = "BRM_FMK_Plugin_CommanderLock";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_CommanderLock {
		class functions {
			file = "\broma_framework\plugins\commander_lock\functions";
			class postInit {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_CommanderLock {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
