class CfgPatches {
	class BRM_FMK_Engine {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = {"BRM_FRAMEWORK"};
	};
};

class CfgFunctions {
	class BRM_FMK_Engine {
		class init {
			file = "\broma_framework\engine\init";
			class preInit {preInit = 1;};
			class postInit {postInit = 1;};
			class endLoading {};
		};

		class ending {
			file = "\broma_framework\engine\ending";
			class endMission {};
			class getEnding {};
		};

		class events {
			file = "\broma_framework\engine\events";
			class initPlayer {};
			class initSpectator {};
			class endSpectator {};
		};

		class oldInit {
			file = "\broma_framework\engine\oldInit";
			class initVariables {};
			class loadContentCargo {};
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

		class mission {
			file = "\broma_framework\engine\mission";
			class loadSettings {};
			class loadBriefing {};
		};

		class plugins {
			file = "\broma_framework\engine\plugins";
			class loadPlugins {};
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
			class setAlias {};
			class defineGroups {};
			class createPlayerVehicles {};
			class generateRadioStructure {};
			class joinDeadGroup {};
			class setUnitIdentity {};
			class handleKilled {};
			class handleHit {};
			class addScore {};
		};
	};

	class BRM_FMK_Engine_API {
		tag = "BRM_FMK";

		class events {
			file = "\broma_framework\engine\events";
			class initAI {};
		};

		class oldInit {
			file = "\broma_framework\engine\oldInit";
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

		class api_loadout {
			file = "\broma_framework\engine\api\loadout";
			class assignCargo {};
			class assignLoadout {};
			class getLoadoutProperty {};
		};

		class api_markers {
			file = "\broma_framework\engine\api\markers";
			class newMarker {};
			class newMarkerArea {};
			class newMarkerIcon {};
		};

		class api_missions {
			file = "\broma_framework\engine\api\missions";
			class endMission {};
		};

		class api_missions_deprecated {
			file = "\broma_framework\engine\api\missions\deprecated";
			class callEnding {};
		};

		class api_plugins {
			file = "\broma_framework\engine\api\plugins";
			class isPluginActive {};
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
			class respawn {};
			class unitFromName {};
		};

		class api_weapons {
			file = "\broma_framework\engine\api\weapons";
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

	class BRM {
		class preInit { // Disable mission's preInit functions
			class loadSettings { file = "\broma_framework\engine\mission\empty.sqf"; };
			class initVariables { file = "\broma_framework\engine\mission\empty.sqf"; };
			class engine_pre { file = "\broma_framework\engine\mission\empty.sqf"; };
		};
		class postInit { // Disable mission's postInit functions
			class logPlugins { file = "\broma_framework\engine\mission\empty.sqf"; };
			class warnConflict { file = "\broma_framework\engine\mission\empty.sqf"; };
			class defineGroups { file = "\broma_framework\engine\mission\empty.sqf"; };
			class createPlayerVehicles { file = "\broma_framework\engine\mission\empty.sqf"; };
			class readExtraction { file = "\broma_framework\engine\mission\empty.sqf"; };
			class initPlayer { file = "\broma_framework\engine\mission\empty.sqf"; };
			class loadBriefing { file = "\broma_framework\engine\mission\empty.sqf"; };
		};
		class overrides { // Force mission functions to use addon version
			file = "\broma_framework\engine\mission\overrides";
			class callEnding {};
			class onPlayerKilled { file = "\broma_framework\engine\mission\empty.sqf"; };
			class onPlayerRespawn { file = "\broma_framework\engine\mission\empty.sqf"; };
			class initAI {};
			class onAIKilled { file = "\broma_framework\engine\mission\empty.sqf"; };
			class assignLoadout {};
			class assignCargo {};
			class getLoadoutProperty {};
		};
	};

    class BRM_endLoading {
        class postInit { // Disable mission's postInit functions
            class endLoading { file = "\broma_framework\engine\mission\empty.sqf"; };
        };
    };
};

class Extended_Hit_EventHandlers {
	class CAManBase {
		class BRM_FMK_Engine {
			hit = "_this call BRM_FMK_Engine_fnc_handleHit;";
		};
	};
};

class Extended_Killed_EventHandlers {
	class CAManBase {
		class BRM_FMK_Engine {
			killed = "_this call BRM_FMK_Engine_fnc_handleKilled";
		};
	};
};
