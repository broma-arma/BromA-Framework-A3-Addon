class BRM_FMK {
	class Plugins {
		class intros {
			name = "Intro cutscenes";
			version = 1;
			authors[] = {"Nife", "Coryf88"};
			description = "Plays a pre-made intro cutscene to set the mood for the mission.";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Intros {
		class functions {
			file = "\broma_framework\plugins\intros\functions";
			class postInit {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_Plugin_Intros {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
