class BRM_FMK {
	class Plugins {
		class friendly_fire {
			name = "Friendly fire";
			version = 1;
			authors[] = {"Nife", "Coryf88"};
			description = "Alerts both the perpetrator and the victim whenever a friendly fire incident takes place.";
			tag = "BRM_FMK_Plugin_FriendlyFire";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_FriendlyFire {
		class functions {
			file = "\broma_framework\plugins\friendly_fire\functions";
			class postInit {};
			class alert {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_FriendlyFire {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
