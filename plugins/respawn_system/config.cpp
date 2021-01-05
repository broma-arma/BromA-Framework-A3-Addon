#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "Respawn System";
		authors[] = { "Nife" };
		description = "Manages and keeps track of players lives, ensuring they can respawn for only a finite amount of times, and making sure that once these lives run out they stay dead even upon attempts to reconnect.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	respawn_system = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\respawn_system\functions";

			CFGFNC(preInit);
			CFGFNC(setParams);
			CFGFNC(postinit);
		};

		class Functions {
			file = "\broma_framework\plugins\respawn_system\functions";

			CFGFNC(removeFromMission);
			CFGFNC(onRespawn);
			CFGFNC(getLives);
			CFGFNC(setLives);
			CFGFNC(callRespawn);
			CFGFNC(callRespawnSide);
			CFGFNC(killPlayer);
		};
	};
};
