class BRM_FMK {
	class Plugins {
		class ace3_plugin {
			name = "ACE3 Plugin";
			version = 1;
			authors[] = {"nigel", "Coryf88"};
			description = "Allows for the easy configuration of the ACE3 mod settings, including the Medical system and other modules.";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_ACE3 {
		class functions {
			file = "\broma_framework\plugins\ace3_plugin\functions";
			class setParams {};
			class postInit {};
			class addACEHelp {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_Plugin_ACE3 {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
