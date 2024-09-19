class BRM_FMK {
	class Plugins {
		class time_limit {
			name = "Time limit";
			version = 1;
			authors[] = {"Nife", "Coryf88"};
			description = "Ends the mission after a parameter set amount of time has passed, and based on mission settings alerts the player on relevant times to the mission maker.";
			tag = "BRM_FMK_Plugin_TimeLimit";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_TimeLimit {
		class functions {
			file = "\broma_framework\plugins\time_limit\functions";
			class setParams {};
			class postInit {};
			class addTime {};
			class removeTime {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_TimeLimit {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
