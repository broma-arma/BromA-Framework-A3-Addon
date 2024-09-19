class BRM_FMK {
	class Plugins {
		class map_cover {
			name = "Map Cover";
			version = 1;
			authors[] = {"Nife", "Coryf88"};
			description = "Highlights the AO in the map by enclosing it and darkening the unused part.";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_MapCover {
		class functions {
			file = "\broma_framework\plugins\map_cover\functions";
			class postInit {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_Plugin_MapCover {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
