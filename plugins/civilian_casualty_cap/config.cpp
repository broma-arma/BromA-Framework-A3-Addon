class BRM_FMK {
	class Plugins {
		class civilian_casualty_cap {
			name = "Civilian casualty cap";
			version = 1;
			authors[] = {"Nife", "Coryf88"};
			description = "Punishes players for killing a parameter determined amount of civilians, compatible with both COOP and TvTs.";
			tag = "BRM_FMK_Plugin_CivilianCasualtyCap";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_CivilianCasualtyCap {
		class functions {
			file = "\broma_framework\plugins\civilian_casualty_cap\functions";
			class preInit {};
			class postInit {};
			class civInit {};
			class civKilled {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_CivilianCasualtyCap {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
