class BRM_FMK {
	class Plugins {
		class radiofreq {
			name = "Radio channel generator";
			version = 1;
			authors[] = {"Nife"};
			description = "Generates radio channels and frequencies based on what groups are active in the mission.";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_RadioFreq {
		class functions {
			file = "\broma_framework\plugins\radiofreq\functions";
			class postInit {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_Plugin_RadioFreq {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
