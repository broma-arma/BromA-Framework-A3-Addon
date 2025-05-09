#define MAJOR 0
#define MINOR 84
#define REVISION 11

#define VERSION MAJOR.MINOR.REVISION
#define VERSION_AR MAJOR,MINOR,REVISION

#define QUOTE(var1) #var1

class CfgPatches {
	class BRM_FRAMEWORK {
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = {};
		author = "BromA";
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
		#include "\broma_framework\loadouts\functions.cpp"
	};
};

class BRM_FMK {
#include "\broma_framework\engine\configs\Endings.hpp"
#include "\broma_framework\loadouts\configs\Voices.hpp"
#include "\broma_framework\loadouts\configs\Faces.hpp"
#include "\broma_framework\loadouts\configs\Names.hpp"
#include "\broma_framework\loadouts\configs\Factions.hpp"
#include "\broma_framework\loadouts\configs\Structures.hpp"
};

#include "CfgNotifications.hpp"
#include "CfgDebriefing.hpp"
#include "CfgTaskDescriptions.hpp"

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
