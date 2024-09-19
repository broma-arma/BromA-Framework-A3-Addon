class BRM_FMK {
	class Plugins {
		class f_remove_body {
			name = "Automatic body removal";
			version = 1;
			authors[] = {"Coryf88"};
			description = "Ensures dead units will have their bodies removed after a certain amount of time, granted they are apart players by a certain distance.";
			tag = "BRM_FMK_Plugin_RemoveBody";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_RemoveBody {
		class functions {
			file = "\broma_framework\plugins\f_remove_body\functions";
			class postInit {};
			class removeBody {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_f_remove_body {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
