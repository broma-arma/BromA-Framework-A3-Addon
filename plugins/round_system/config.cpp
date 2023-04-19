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
		class init {
			file = "\broma_framework\plugins\round_system\functions";
			CFGFNC(preInit);
			CFGFNC(postInit);
		};

		class general {
			file = "\broma_framework\plugins\round_system\functions";
			CFGFNC(getSettings);
			CFGFNC(beginMatch);
		};

		class server {
			file = "\broma_framework\plugins\round_system\functions\server";
			CFGFNC(roundEnd);
			CFGFNC(roundHandleResults);
			CFGFNC(resetRoundVariables);
			CFGFNC(roundStart);
			CFGFNC(checkRoundEnd);
			CFGFNC(setMatchVariables);
			CFGFNC(CasualtiesCapCheck);
		};

		class player {
			file = "\broma_framework\plugins\round_system\functions\player";
			CFGFNC(roundEndPlayer);
			CFGFNC(roundStartPlayer);
			CFGFNC(displayWinner);
			CFGFNC(moveToRespawn);
			CFGFNC(registerZone);
			CFGFNC(setupZone);
		};
	};
};

class BRM_FMK_Plugins {
	class round_system {
		name = "Round System";
		disabled = 1;
		version = 1;
		authors[] = {"Nife"};
		conflict_plugins[] = {"spawn_protection", "casualties_cap", "commander_lock"};
		description = "This plugin manages rounds for TvT/COTvT missions.";
		preInit[] = {QFUNC(preInit)};
		postInit[] = {QFUNC(postInit)};
	};
};
