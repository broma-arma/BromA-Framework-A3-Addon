class BRM_FMK_AIS {
	class general {
		file = "\broma_framework\plugins\ai_spawner\functions";

		class postInit {};
		class getSettings {};

		class createGroup {};
		class initGroup {};
		class createVehicleCrew {};
		class getSpawner {};
		class updateSpawner {};
		class toggleSpawner {};
		class deleteSpawner {};
		class cacheUnit {};
		class cacheGroup {};
		class garbageCollector {};
		class garbageCollectorCheck {};
		class applyToAllAi {};
		class checkBadSpawn {};
	};

	class spawners {
		file = "\broma_framework\plugins\ai_spawner\functions\spawners";
		class attackSpawner {};
		class defenseSpawner {};
		class stalkSpawner {};
	};

	class tasks {
		file = "\broma_framework\plugins\ai_spawner\functions\tasks";
		class taskStalk {};
		class taskAttack {};
		class taskPatrol {};
	};

	class events {
		file = "\broma_framework\plugins\ai_spawner\functions\events";
		class eventReloaded {};
		class eventKilled {};
	};

	class debug {
		file = "\broma_framework\plugins\ai_spawner\functions\debug";
		class spawnersInfo {};
		class createIconMarker {};
		class createGroupMarker {};
		class createZoneMarker {};
		class createCampsMarkers {};
		class updateZoneMarker {};
		class updateCampsMarkers {};
		class createAttackMarkers {};
	};

	class utils {
		file = "\broma_framework\plugins\ai_spawner\functions\utils";
		class countGroupType {};
		class getVehicleSeats {};
		class checkVisibility {};
		class checkNearPlayers {};
		class findPosition {};
		class toPosition {};
		class getById {};
		class drawMarkerLine {};
		class typeHasVehicle {};
		class isCacheable {};
		class getSideColor {};
	};
};
