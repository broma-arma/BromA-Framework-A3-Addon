class CfgPatches {
	class BRM_FMK_Engine {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};

class CfgFunctions {
	class BRM_FMK_Engine {
		class ending {
			file = "\broma_framework\engine\ending";
			class getEnding {};
		};

		class events {
			file = "\broma_framework\engine\events";
			class initPlayer {};
			class initSpectator {};
			class endSpectator {};
		};

		class init {
			file = "\broma_framework\engine\init";
			class initVariables {};
			class engine_pre {};
			class loadContentCargo {};
			class engine_post {postInit = 1;};
		};

		class loadout {
			file = "\broma_framework\engine\loadout";
			class getLoadoutCode {};
		};

		class misc {
			file = "\broma_framework\engine\misc";
			class getSpawnPoint {};
			class stampTime {};
			class syncTime {};
		};

		class plugins {
			file = "\broma_framework\engine\plugins";
			class logPlugins {};
		};

		class tasks {
			file = "\broma_framework\engine\tasks";
			class readExtraction {};
			class createExtractionMarker {};
		};

		class unit {
			file = "\broma_framework\engine\unit";
			class removeJIP {};
			class setHitFace {};
			class setGrpIDGlobal {};
			class setAlias {};
			class defineGroups {};
			class createPlayerVehicles {};
			class generateRadioStructure {};
			class joinDeadGroup {};
			class setUnitIdentity {};
		};
	};

	class BRM_FMK_Engine_API {
		tag = "BRM_FMK";

		class ending {
			file = "\broma_framework\engine\ending";
			class callEnding {};
		};

		class events {
			file = "\broma_framework\engine\events";
			class initAI {};
		};

		class init {
			file = "\broma_framework\engine\init";
			class assignSideProperties {};
		};

		class misc {
			file = "\broma_framework\engine\misc";
			class getMusic {};
			class doLog {};
		};

		class tasks {
			file = "\broma_framework\engine\tasks";
			class newTask {};
			class setTask {};
			class checkTasks {};
		};

		class unit {
			file = "\broma_framework\engine\unit";
			class handleScore {};
		};
	};

	class BRM_FMK_API {
		tag = "BRM_FMK";

		class api {
			file = "\broma_framework\engine\api";
			class reachTarget {};
			class artillery {};
			class cas {};
			class halo {};
			class paratroop {};
		};

		class api_ai {
			file = "\broma_framework\engine\api\ai";
			class garrisonUnits {};
		};

		class api_arrays {
			file = "\broma_framework\engine\api\arrays";
			class verboseArray {};
			class appendIndices {};
		};

		class api_deprecated {
			file = "\broma_framework\engine\api\deprecated";
			class getUnitsArray {};
			class getFactionVehicles {};
			class setVehiclesArray {};
		};

		class api_faction {
			file = "\broma_framework\engine\api\faction";
			class getFactionInfo {};
		};

		class api_markers {
			file = "\broma_framework\engine\api\markers";
			class newMarker {};
			class newMarkerArea {};
			class newMarkerIcon {};
		};

		class api_sides {
			file = "\broma_framework\engine\api\sides";
			class getSideInfo {};
			class checkCasualties {};
		};

		class api_sounds {
			file = "\broma_framework\engine\api\sounds";
			class playGlobal {};
			class playCfgSound {};
		};

		class api_strings {
			file = "\broma_framework\engine\api\strings";
			class formatElapsedTime {};
		};

		class api_triggers {
			file = "\broma_framework\engine\api\triggers";
			class callCodeArea {};
		};

		class api_ui {
			file = "\broma_framework\engine\api\ui";
			class showText {};
			class colorToHex {};
		};

		class api_unit {
			file = "\broma_framework\engine\api\unit";
			class alive {};
			class unitFromName {};
		};

		class api_weapons {
			file = "\broma_framework\engine\api\weapons";
			class weaponAway {};
			class isDisposableLauncher {};
		};

		class api_zeus {
			file = "\broma_framework\engine\api\zeus";
			class z_setAll {};
			class z_setMode {};
			class z_setSkill {};
			class z_setLoadout {};
		};
	};
};
