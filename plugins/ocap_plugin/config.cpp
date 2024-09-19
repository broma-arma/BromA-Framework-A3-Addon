class BRM_FMK {
	class Plugins {
		class ocap_plugin {
			name = "OCAP Plugin";
			version = 0.5;
			authors[] = {"MrGoodson", "Nife"};
			description = "Plugin to initialize all OCAP functions.";
			tag = "BRM_FMK_Plugin_OCAP";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_OCAP {
		class functions {
			file = "\broma_framework\plugins\ocap_plugin\functions";
			class init {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_OCAP {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
