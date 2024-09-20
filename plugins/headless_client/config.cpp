class BRM_FMK {
	class Plugins {
		class headless_client {
			name = "Headless Client";
			version = 1;
			authors[] = {"Nife"};
			description = "Suite of functions made to facilitate the usage of the Headless Client and its environment variables.";
			tag = "BRM_FMK_Plugin_HC";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_HC {
		class functions {
			file = "\broma_framework\plugins\headless_client\functions";
			class postInit {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_HC {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
