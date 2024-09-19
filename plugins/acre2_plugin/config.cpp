class BRM_FMK {
	class Plugins {
		class acre2_plugin {
			name = "ACRE2 Plugin";
			version = 1;
			authors[] = {"Nife"};
			description = "Sets up environment variables and functions necessary to work with the Advanced Combat Radio Environment 2 radio system.";
			tag = "BRM_FMK_Plugin_ACRE2";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_ACRE2 {
		class functions {
			file = "\broma_framework\plugins\acre2_plugin\functions";
			class postInit {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_ACRE2 {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
