class BRM_FMK {
	class Plugins {
		class round_system {
			name = "Round System";
			version = 1;
			authors[] = {"Nife"};
			description = "This plugin manages rounds for TvT/COTvT missions.";
			conflict_plugins[] = {"spawn_protection", "f_casualties_cap", "commander_lock"};
			tag = "BRM_FMK_Plugin_RoundSystem";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_RoundSystem {
		class functions {
			file = "\broma_framework\plugins\round_system\functions";
			class preInit {};
			class postInit {};
		};
		class server {
			file = "\broma_framework\plugins\round_system\functions\server";
			class roundEnd {};
			class roundHandleResults {};
			class resetRoundVariables {};
			class roundStart {};
			class checkRoundEnd {};
			class setMatchVariables {};
			class CasualtiesCapCheck {};
		};
		class player {
			file = "\broma_framework\plugins\round_system\functions\player";
			class roundEndPlayer {};
			class roundStartPlayer {};
			class displayWinner {};
			class moveToRespawn {};
			class registerZone {};
			class setupZone {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_Round_System {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
