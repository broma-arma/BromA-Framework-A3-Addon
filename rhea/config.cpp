#include "defines.hpp"

class CfgPatches {
	class BRM_FMK_Rhea {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = {"BRM_FRAMEWORK", "A3_Modules_F", "A3_UI_F", "3DEN", "cba_xeh", "cba_settings"};
	};
};

class CfgFunctions {
	class BRM_FMK_RHEA_SERVER {
		class general {
			file = "\broma_framework\rhea\functions\server";
			class preInit { preInit = 1; RECOMPILE; };
			class postInit { postInit = 1; RECOMPILE; };

			class loginPlayer { RECOMPILE; };
			class logoutPlayer { RECOMPILE; };
			class startZeus { RECOMPILE; };
			class stopZeus { RECOMPILE; };

			class deleteDead { RECOMPILE; };
			class cleanup { RECOMPILE; };
			class rearmVehicle { RECOMPILE; };
		};
	};
	class BRM_FMK_RHEA_REMOTE {
		class general {
			file = "\broma_framework\rhea\functions\server";
			class teleport {};
		};
	};

	class BRM_FMK_RHEA {
		class general {
			file = "\broma_framework\rhea\functions\client";
			class preInit { preInit = 1; RECOMPILE; };
			class postInit { postInit = 1; RECOMPILE; };
	
			class open { RECOMPILE; };
			class isOpen { RECOMPILE; };
			class isLoggedIn { RECOMPILE; };
	
			class initMainMenu { RECOMPILE; };
	
			class initDisplay { RECOMPILE; };
			class initDisplayCurator { RECOMPILE; };
			class initModuleCurator { RECOMPILE; };
	
			class login { RECOMPILE; };
			class logout { RECOMPILE; };
	
			class listPlayers { RECOMPILE; };
			class listTasks { RECOMPILE; };
	
			class menuBar { RECOMPILE; };
			class playerMenu { RECOMPILE; };
			class taskMenu { RECOMPILE; };
	
			class initConditions { RECOMPILE; };
	
			class inputDialog { RECOMPILE; };
	
			class debug { RECOMPILE; };
	
			class message { RECOMPILE; };
		};
	};
};

class Extended_DisplayLoad_EventHandlers {
	class RscDisplayCurator {
		BRM_FMK_RHEA_initKeys = "_this call BRM_FMK_RHEA_fnc_initDisplayCurator";
	};
	class RscDisplayEGSpectator {
		BRM_FMK_RHEA_initKeys = "_this call BRM_FMK_RHEA_fnc_initDisplay";
	};
};

class Extended_Init_EventHandlers {
	class ModuleCurator_F {
		class BRM_FMK_RHEA_ModuleCurator_F_init_eh {
			init = "_this call BRM_FMK_RHEA_fnc_initModuleCurator";
		};
	};
};

#include "dialogs\common.hpp"
#include "dialogs.hpp"
