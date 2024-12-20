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
	class BRM_FMK_Plugin_RadioFreq {
		class functions {
			file = "\broma_framework\plugins\radiofreq\functions";
			class preInit {};
			class postInit {};
			class switchGroup {};
			class editRadioSettings {};
			class handleVehicleRadio {};
			class saveVehicleRadioSettings {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_RadioFreq {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
