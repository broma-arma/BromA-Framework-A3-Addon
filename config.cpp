#define MAJOR 0
#define MINOR 83
#define REVISION 0

#define VERSION MAJOR.MINOR.REVISION
#define VERSION_AR MAJOR,MINOR,REVISION

#define QUOTE(var1) #var1

class CfgPatches {
	class BRM_FRAMEWORK {
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = {};
		author = "Nife";
		versionDesc = "Broma Framework MK 4 APEX";
		version = VERSION;
		versionStr = QUOTE(VERSION);
		versionAr[] = {VERSION_AR};
	};
};

class CfgSettings {
	class CBA {
		class Versioning {
			class BRM_FRAMEWORK {
				main_addon = "BRM_FRAMEWORK";
			};
		};
	};
};

class CfgFunctions {
	class BRM_FMK {
		tag = BRM_FMK;

		#include "\broma_framework\engine\api\functions.cpp"
		#include "\broma_framework\engine\ending\functions.cpp"
		#include "\broma_framework\engine\events\functions.cpp"
		#include "\broma_framework\engine\init\functions.cpp"
		#include "\broma_framework\engine\loadouts\functions.cpp"
		#include "\broma_framework\engine\misc\functions.cpp"
		#include "\broma_framework\engine\mission\functions.cpp"
		#include "\broma_framework\engine\plugins\functions.cpp"
		#include "\broma_framework\engine\tasks\functions.cpp"
		#include "\broma_framework\engine\unit\functions.cpp"

		#include "\broma_framework\loadouts\functions.cpp"
	};

	#define BRM_PLUGIN_FUNCTIONS
		#include "plugins\plugins.cpp"
	#undef BRM_PLUGIN_FUNCTIONS
};

class BRM_FMK_Plugins {
    #define BRM_PLUGIN_META
        #include "\broma_framework\plugins\plugins.cpp"
    #undef BRM_PLUGIN_META
};

#define BRM_PLUGIN_DIALOGS
	#include "plugins\plugins.cpp"
#undef BRM_PLUGIN_DIALOGS

#include "CfgNotifications.hpp"
#include "BRM_FMK_Endings.hpp"

class Extended_DisplayLoad_EventHandlers {
	class RscDisplayEGSpectator {
		BRM_FRAMEWORK = "['BRM_FMK_DisplayLoad_EGSpectator', _this] call CBA_fnc_localEvent;";
	};
};

class Extended_DisplayUnload_EventHandlers {
	class RscDisplayEGSpectator {
		BRM_FRAMEWORK = "['BRM_FMK_DisplayUnload_EGSpectator', _this] call CBA_fnc_localEvent;";
	};
};

class BRM_FMK_Loadouts {
	class Factions {
		#include "loadouts\factions.hpp"
	};
	class Structures {
		#include "loadouts\structures.hpp"
	};
};
