class BRM_FMK {
	class Plugins {
		class time_accel {
			name = "Time Acceleration";
			version = 1;
			authors[] = {"Nife"};
			description = "Accelerates time as determined by mission parameters.";
			tag = "BRM_FMK_Plugin_TimeAcceleration";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_TimeAcceleration {
		class functions {
			file = "\broma_framework\plugins\time_accel\functions";
			class postInit {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_TimeAcceleration {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
