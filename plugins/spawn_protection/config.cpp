class BRM_FMK {
	class Plugins {
		class spawn_protection {
			name = "Spawn protection";
			version = 1;
			authors[] = {"Nife", "Coryf88"};
			description = "Creates a protection zone around the insertion point, which can last forever or as long as the mission parameters determine, ensuring neither players or friendly vehicles can take damage while inside.";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_SpawnProtection {
		class functions {
			file = "\broma_framework\plugins\spawn_protection\functions";
			class setParams {};
			class postInit {};
			class allowDamage {};
			class clientMarker {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_Plugin_SpawnProtection {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
