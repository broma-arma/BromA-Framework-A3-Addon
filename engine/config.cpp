#include "component.hpp"

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
		class api {
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
		};

		class api_zeus {
			file = "\broma_framework\engine\api\zeus";

			CFGFNC(z_setAll);
			CFGFNC(z_setMode);
			CFGFNC(z_setSkill);
			CFGFNC(z_setLoadout);
		};

		class ending {
			file = "\broma_framework\engine\ending";

			CFGFNC(callEnding);
		};

		class events {
			file = "\broma_framework\engine\events";

			CFGFNC(initPlayer);
			CFGFNC(initAI);
			CFGFNC(initSpectator);
			CFGFNC(endSpectator);
		};

		class init {
			file = "\broma_framework\engine\init";

			CFGFNC(doLog);
			CFGFNC(engine_pre);
			CFGFNC(initVariables);
			CFGFNC(assignSideProperties);
			CFGFNC_1(engine_post,postInit=1);
		};

		class misc {
			file = "\broma_framework\engine\misc";

			CFGFNC(getSpawnPoint);
			CFGFNC(stampTime);
			CFGFNC(syncTime);
			CFGFNC(getMusic);
		};

		class plugins {
			file = "\broma_framework\engine\plugins";

			CFGFNC(logPlugins);
			CFGFNC(warnConflict);
		};

		class tasks {
			file = "\broma_framework\engine\tasks";

			CFGFNC(readExtraction);
			CFGFNC(newTask);
			CFGFNC(setTask);
			CFGFNC(checkTasks);
		};

		class unit {
			file = "\broma_framework\engine\unit";

			CFGFNC(handleScore);
			CFGFNC(removeJIP);
			CFGFNC(setHitFace);
			CFGFNC(setGrpIDGlobal);
			CFGFNC(setAlias);
			CFGFNC(defineGroups);
			CFGFNC(createPlayerVehicles);
			CFGFNC(generateRadioStructure);
		};
	};
};
