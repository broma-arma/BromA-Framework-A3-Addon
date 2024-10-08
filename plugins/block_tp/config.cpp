class BRM_FMK {
	class Plugins {
		class block_tp {
			name = "Block third-person";
			version = 1;
			authors[] = {"Nife", "Coryf88"};
			description = "Simple script meant to stop players from using third person mode if they do not meet certain conditions. (Being a vehicle driver/commander)";
			tag = "BRM_FMK_Plugin_BlockThirdPerson";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_BlockThirdPerson {
		class functions {
			file = "\broma_framework\plugins\block_tp\functions";
			class postInit {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_BlockThirdPerson {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
