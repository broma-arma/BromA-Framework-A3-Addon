class BRM_FMK {
	class Plugins {
		class loading_screen {
			name = "Loading screen";
			version = 1.5;
			authors[] = {"Nife", "Coryf88"};
			description = "Displays a short test screen to avoid players from shooting each other while loading the mission.";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_LoadingScreen {
		class functions {
			file = "\broma_framework\plugins\loading_screen\functions";
			class postInit {};
			class clientLoaded {};
			class load {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_LoadingScreen {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
