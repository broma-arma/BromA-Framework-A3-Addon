class BRM_FMK {
	class Plugins {
		class respawn_system {
			name = "Respawn System";
			version = 1;
			authors[] = {"Nife", "Coryf88"};
			description = "Manages and keeps track of players lives, ensuring they can respawn for only a finite amount of times, and making sure that once these lives run out they stay dead even upon attempts to reconnect.";
			tag = "BRM_FMK_Plugin_RespawnSystem";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_RespawnSystem {
		class functions {
			file = "\broma_framework\plugins\respawn_system\functions";
			class preInit {};
			class postInit {};
			class removeFromMission {};
			class onRespawn {};
			class getLives {};
			class setLives {};
			class callRespawn {};
			class callRespawnSide {};
			class killPlayer {};
		};
	};
	class BRM_FMK_RespawnSystem {
		class functions {
			file = "\broma_framework\plugins\respawn_system\functions\deprecated";
			class callRespawn {};
			class callRespawnSide {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_RespawnSystem {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
