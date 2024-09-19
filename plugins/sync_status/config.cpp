class BRM_FMK {
	class Plugins {
		class sync_status {
			name = "Synchronize Status";
			version = 1;
			authors[] = {"Nife", "Coryf88"};
			description = "Constantly sends your current position and over relevant data to the server, and synchronizes it every time you JIP back into the session.";
			tag = "BRM_FMK_Plugin_SyncStatus";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_SyncStatus {
		class functions {
			file = "\broma_framework\plugins\sync_status\functions";
			class postInit {};
			class saveStatus {};
			class loadStatus {};
			class playerVars {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_SyncStatus {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
