#ifdef BRM_PLUGIN_META
	class round_system {
		name = "Round System";
		version = 1;
		authors[] = {"Nife"};
		conflict_plugins[] = {"spawn_protection", "f_casualties_cap", "commander_lock"};
		description = "This plugin manages rounds for TvT/COTvT missions.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_Round_System {
	class functions {
		file = "\broma_framework\plugins\round_system\functions";
		class preInit {};
		class setParams {};
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
#endif
