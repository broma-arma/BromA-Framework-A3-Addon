class BRM_FMK {
	class Plugins {
		class tfar_plugin {
			name = "TFAR Plugin";
			version = 1;
			authors[] = {"Nife"};
			description = "Sets up environment variables and functions necessary to work with the Task Force Radio Alpha radio system.";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_TFAR {
		class functions {
			file = "\broma_framework\plugins\tfar_plugin\functions";
			class postInit {};
			class autoSetupRadios {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_TFAR {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
