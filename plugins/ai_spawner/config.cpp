#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgFunctions {
	class ADDON {
		class general {
			file = "\broma_framework\plugins\ai_spawner\functions";

			CFGFNC(postInit);
			CFGFNC(getSettings);

			CFGFNC(createGroup);
			CFGFNC(initGroup);
			CFGFNC(createVehicleCrew);
			CFGFNC(getSpawner);
			CFGFNC(updateSpawner);
			CFGFNC(toggleSpawner);
			CFGFNC(deleteSpawner);
			CFGFNC(cacheUnit);
			CFGFNC(cacheGroup);
			CFGFNC(garbageCollector);
			CFGFNC(applyToAllAi);
			CFGFNC(checkBadSpawn);
		};

		class spawners {
			file = "\broma_framework\plugins\ai_spawner\functions\spawners";
			CFGFNC(spawner);
			CFGFNC(attackSpawner);
			CFGFNC(defenseSpawner);
			CFGFNC(stalkSpawner);
		};

		class tasks {
			file = "\broma_framework\plugins\ai_spawner\functions\tasks";
			CFGFNC(taskStalk);
			CFGFNC(taskAttack);
			CFGFNC(taskPatrol);
		};

		class events {
			file = "\broma_framework\plugins\ai_spawner\functions\events";
			CFGFNC(eventReloaded);
			CFGFNC(eventKilled);
		};

		class debug {
			file = "\broma_framework\plugins\ai_spawner\functions\debug";
			CFGFNC(spawnersInfo);
			CFGFNC(createIconMarker);
			CFGFNC(createGroupMarker);
			CFGFNC(createZoneMarker);
			CFGFNC(createCampsMarkers);
			CFGFNC(updateZoneMarker);
			CFGFNC(updateCampsMarkers);
			CFGFNC(createAttackMarkers);
		};

		class utils {
			file = "\broma_framework\plugins\ai_spawner\functions\utils";
			CFGFNC(countGroupType);
			CFGFNC(getVehicleSeats);
			CFGFNC(checkVisibility);
			CFGFNC(checkNearPlayers);
			CFGFNC(findPosition);
			CFGFNC(toPosition);
			CFGFNC(drawMarkerLine);
			CFGFNC(typeHasVehicle);
			CFGFNC(isCacheable);
			CFGFNC(getSideColor);
		};
	};

};

class BRM_FMK_Plugins {
	class ai_spawner {
		name = "AI Spawner";
		version = 0.1;
		authors[] = {"Royal"};
		description = "Spawn AI.";
		postInit[] = {QFUNC(postInit)};
		//requiredPlugins[] = { "headless_client" };
		disabled = 1;
	};
};
