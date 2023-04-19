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
	class PREFIX {
		class engine_api {
			file = "\broma_framework\engine\api";

			CFGFNC(getSideInfo);
			CFGFNC(newMarker);
			CFGFNC(newMarkerArea);
			CFGFNC(newMarkerIcon);
			CFGFNC(stripItems);
			CFGFNC(weaponAway);
			CFGFNC(garrisonUnits);
			CFGFNC(showText);
			CFGFNC(colorToHex);
			CFGFNC(verboseArray);
			CFGFNC(addIfNew);
			CFGFNC(unitFromName);
			CFGFNC(callCodeArea);
			CFGFNC(setGear);
			CFGFNC(getGear);
			CFGFNC(playGlobal);
			CFGFNC(getUnitsArray);
			CFGFNC(getFactionVehicles);
			CFGFNC(appendIndices);
			CFGFNC(teamsExist);
			CFGFNC(reachTarget);
			CFGFNC(checkCasualties);
			CFGFNC(hasActiveCrew);
			CFGFNC(clearWaypoints);
		};

		class engine_api_zeus {
			file = "\broma_framework\engine\api\zeus";

			CFGFNC(z_setAll);
			CFGFNC(z_setMode);
			CFGFNC(z_setSkill);
			CFGFNC(z_setLoadout);
		};

		class engine_ending {
			file = "\broma_framework\engine\ending";

			CFGFNC(callEnding);
		};

		class engine_events {
			file = "\broma_framework\engine\events";

			CFGFNC(initPlayer);
			CFGFNC(initAI);
			CFGFNC(initSpectator);
			CFGFNC(endSpectator);
			CFGFNC(onPlayerKilled);
			CFGFNC(onPlayerRespawn);
			CFGFNC(onAIKilled);
		};

		class engine_init {
			file = "\broma_framework\engine\init";

			CFGFNC_1(engine_pre,preInit=1);
			CFGFNC(initVariables);
			CFGFNC_1(engine_post,postInit=1);
		};

		class engine_loadouts {
			file = "\broma_framework\engine\loadouts";

			CFGFNC(assignLoadout);
			CFGFNC(assignCargo);
			CFGFNC(getLoadoutProperty);
		};

		class engine_misc {
			file = "\broma_framework\engine\misc";

			CFGFNC(getSpawnPoint);
			CFGFNC(stampTime);
			CFGFNC(syncTime);
			CFGFNC(getMusic);
			CFGFNC(versionCompare);
			CFGFNC(doLog);
		};

		class engine_mission {
			file = "\broma_framework\engine\mission";

			CFGFNC(loadMissionSettings);
			CFGFNC(assignSideProperties);
			CFGFNC(loadBriefing);
			CFGFNC(playableMissionEntities);
		};

		class engine_plugins {
			file = "\broma_framework\engine\plugins";

			CFGFNC(logPlugins);
			CFGFNC(warnConflict);
			CFGFNC(getPluginSettings);
		};

		class engine_tasks {
			file = "\broma_framework\engine\tasks";

			CFGFNC(readExtraction);
			CFGFNC(newTask);
			CFGFNC(setTask);
			CFGFNC(checkTasks);
			CFGFNC(createExtractionMarker);
			CFGFNC(updateTaskMarker);
		};

		class engine_unit {
			file = "\broma_framework\engine\unit";

			CFGFNC(handleScore);
			CFGFNC(removeJIP);
			CFGFNC(setHitFace);
			CFGFNC(setGrpIDGlobal);
			CFGFNC(setAlias);
			CFGFNC(defineGroups);
			CFGFNC(createPlayerVehicles);
			CFGFNC(generateRadioStructure);
			CFGFNC(joinDeadGroup);
		};
	};
};
