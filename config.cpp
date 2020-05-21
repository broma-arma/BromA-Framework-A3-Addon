#define MAJOR 0
#define MINOR 81
#define REVISION 3

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
		#include "\broma_framework\engine\misc\functions.cpp"
		#include "\broma_framework\engine\plugins\functions.cpp"
		#include "\broma_framework\engine\tasks\functions.cpp"
		#include "\broma_framework\engine\unit\functions.cpp"

		#include "\broma_framework\loadouts\functions.cpp"
	};

	#define BRM_PLUGIN_FUNCTIONS
		#include "plugins\plugins.cpp"
	#undef BRM_PLUGIN_FUNCTIONS
};

class CfgBRMPlugins {
    #define BRM_PLUGIN_META
        #include "\broma_framework\plugins\plugins.cpp"
    #undef BRM_PLUGIN_META
};

#define BRM_PLUGIN_DIALOGS
	#include "plugins\plugins.cpp"
#undef BRM_PLUGIN_DIALOGS
