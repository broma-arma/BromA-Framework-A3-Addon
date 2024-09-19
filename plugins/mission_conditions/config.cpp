class BRM_FMK {
	class Plugins {
		class mission_conditions {
			name = "Mission Conditions";
			version = 1;
			authors[] = {"Nife"};
			description = "Sets the mission conditions such as weather and time.";
			tag = "BRM_FMK_Plugin_MissionConditions";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_MissionConditions {
		class functions {
			file = "\broma_framework\plugins\mission_conditions\functions";
			class setParams {};
			class postInit {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_MissionConditions {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
