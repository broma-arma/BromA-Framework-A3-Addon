class BRM_FMK {
	class Plugins {
		class f_casualties_cap {
			name = "Casualty cap";
			version = 1;
			authors[] = {"Coryf88"};
			description = "Ends the mission after a certain parameter determined percentage of mission set groups have died.";
			tag = "BRM_FMK_Plugin_CasualtyCap";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_CasualtyCap {
		class functions {
			file = "\broma_framework\plugins\f_casualties_cap\functions";
			class setParams {};
			class postInit {};
			class CasualtiesCapCheck {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_f_cas_cap {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
