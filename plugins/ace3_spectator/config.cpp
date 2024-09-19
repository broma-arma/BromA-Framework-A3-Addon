class BRM_FMK {
	class Plugins {
		class ace3_spectator {
			name = "ACE3 Spectator plugin";
			version = 1;
			authors[] = {"Nife", "Coryf88"};
			description = "Manages some stuff about the spectator system.";
			conflict_plugins[] = {"vanilla_spectator"};
			tag = "BRM_FMK_Plugin_ACE3Spectator";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_ACE3Spectator {
		class functions {
			file = "\broma_framework\plugins\ace3_spectator\functions";
			class postInit {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_ACE3_SPECTATOR {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
