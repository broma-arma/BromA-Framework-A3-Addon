
class CfgPatches {
	class BRM_FRAMEWORK {
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = {};
		version = 1;
		author = "Nife";
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