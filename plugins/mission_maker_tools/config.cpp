class BRM_FMK {
	class Plugins {
		class mission_maker_tools {
			name = "Mission maker tools";
			version = 1;
			authors[] = {"Nife"};
			description = "Handy scripts like opening the Arsenal script available to the mission maker while in the editor.";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_MissionMakerTools {
		class functions {
			file = "\broma_framework\plugins\mission_maker_tools\functions";
			class postInit {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_MissionMakerTools {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
