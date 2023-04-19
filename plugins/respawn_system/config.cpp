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
			file = "\broma_framework\plugins\respawn_system\functions";
			CFGFNC(preInit);
			CFGFNC(postinit);
		};

		class Functions {
			file = "\broma_framework\plugins\respawn_system\functions";
			CFGFNC(getSettings);
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

class BRM_FMK_Plugins {
	class respawn_system {
		name = "Respawn System";
		version = 1;
		authors[] = {"Nife"};
		description = "Manages and keeps track of players lives, ensuring they can respawn for only a finite amount of times, and making sure that once these lives run out they stay dead even upon attempts to reconnect.";
		preInit[] = {QFUNC(preInit)};
		postInit[] = {QFUNC(postInit)};
	};
};
