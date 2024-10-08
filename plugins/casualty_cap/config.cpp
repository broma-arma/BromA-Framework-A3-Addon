class BRM_FMK {
	class Plugins {
		class casualty_cap {
			name = "Casualty cap";
			version = 1;
			authors[] = {"Coryf88"};
			description = "Ends the mission after a certain parameter determined percentage of mission set groups have died.";
			tag = "BRM_FMK_Plugin_CasualtyCap";
		};
		class f_casualties_cap: casualty_cap {}; // Backward compatibility
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_CasualtyCap {
		class functions {
			file = "\broma_framework\plugins\casualty_cap\functions";
			class postInit {};
			class CasualtiesCapCheck {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_CasualtyCap {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
