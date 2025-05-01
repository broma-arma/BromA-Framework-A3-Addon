class BRM_FMK {
	class Plugins {
		class ai_spawner {
			name = "AI Spawner";
			version = 0.1;
			authors[] = {"Royal", "Coryf88"};
			description = "Spawn AI.";
			tag = "BRM_FMK_Plugin_AIS";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_AIS {
		class init {
			file = "\broma_framework\plugins\ai_spawner\functions";

			class postInit {};
			class postInitScript {postInit = 1;};
		};

		class spawner {
			file = "\broma_framework\plugins\ai_spawner\functions\spawner";
			class spawnerManager {};

			class attackSpawner {};
			class defendSpawner {};
			class stalkSpawner {};
		};

		class task {
			file = "\broma_framework\plugins\ai_spawner\functions\task";
			class taskAttack {};
			class taskPatrol {};
			class taskStalk {};
		};

		class group {
			file = "\broma_framework\plugins\ai_spawner\functions\group";
			class createGroup {};
		};

		class cache {
			file = "\broma_framework\plugins\ai_spawner\functions\cache";
			class cacheUnit {};
			class cacheGroup {};
			class cacheManager {};
		};

		class setting {
			file = "\broma_framework\plugins\ai_spawner\functions\setting";
			class getGroupSettings {};
			class getSkillSettings {};
			class getSpawnerSettings {};
			class getWaypointSettings {};
		};

		class util {
			file = "\broma_framework\plugins\ai_spawner\functions\util";
			class countGroupType {};
			class findPosition {};
			class getVehicleSeats {};
			class isPlayerNear {};
		};

		class debug {
			file = "\broma_framework\plugins\ai_spawner\functions\debug";
			class spawnersInfo {};
			class createGroupMarker {};
			class createLineMarker {};
		};
	};

	class BRM_FMK_AIS {
		class api {
			file = "\broma_framework\plugins\ai_spawner\functions\api";
			class createSpawner {};
			class pauseSpawner {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_AIS {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
