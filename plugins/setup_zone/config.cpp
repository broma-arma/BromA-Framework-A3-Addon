class BRM_FMK {
	class Plugins {
		class setup_zone {
			name = "Setup zone";
			version = 1;
			authors[] = {"Nife", "Coryf88"};
			description = "Whenever a TvT mission is starting, players are forced to wait a set amount of time before being able to leave their start zones.";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_SetupZone {
		class functions {
			file = "\broma_framework\plugins\setup_zone\functions";
			class setParams {};
			class postInit {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_SetupZone {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
