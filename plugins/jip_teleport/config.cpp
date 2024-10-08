class BRM_FMK {
	class Plugins {
		class jip_teleport {
			name = "JIP teleport";
			version = 1;
			authors[] = {"Nife", "Coryf88"};
			description = "Teleports JIPs to their nearest living team-member.";
			tag = "BRM_FMK_Plugin_JIPTeleport";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_JIPTeleport {
		class functions {
			file = "\broma_framework\plugins\jip_teleport\functions";
			class postInit {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_JIPTeleport {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
