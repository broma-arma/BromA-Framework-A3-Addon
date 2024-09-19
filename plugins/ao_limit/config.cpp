class BRM_FMK {
	class Plugins {
		class ao_limit {
			name = "AO Limit";
			version = 1;
			authors[] = {"Nife"};
			description = "Displays a message (or anything nastier) to players who leave the designated Area of Operations.";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_AOLimit {
		class functions {
			file = "\broma_framework\plugins\ao_limit\functions";
			class postInit {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_AOLimit {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
