class BRM_FMK {
	class Plugins {
		class vanilla_spectator {
			name = "Vanilla Spectator System";
			version = 1;
			authors[] = {"Bohemia Interactive", "Nife", "Coryf88"};
			description = "This plugin enables compatibility with the vanilla spectator system.";
			conflict_plugins[] = {"ace3_spectator"};
		};
	};
};

class CfgFunctions {
	class BRM_FMK_VanillaSpectator {
		class functions {
			file = "\broma_framework\plugins\vanilla_spectator\functions";
			class preInit {};
			class getSettings {};
			class centerOnTarget {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_Plugin_VanillaSpectator {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
