class BRM_FMK {
	class Plugins {
		class f_evade_escape {
			name = "Evade and Escape";
			version = 1;
			authors[] = {"Nife", "Coryf88"};
			description = "Ends the mission when the specified units reach a certain point.";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_EvadeEscape {
		class functions {
			class reachObject {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_f_evade_escape {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
