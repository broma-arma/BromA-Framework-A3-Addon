#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "Round System";
		authors[] = { "Nife" };
		description = "This plugin manages rounds for TvT/COTvT missions.";
		conflict_plugins[] = { "spawn_protection", "f_casualties_cap", "commander_lock" };

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	round_system = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\round_system\functions";

			CFGFNC(preInit);
			CFGFNC(setParams);
			CFGFNC(postInit);
		};

		class general {
			file = "\broma_framework\plugins\round_system\functions";

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
