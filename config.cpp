#include "script_component.hpp"

class CfgPatches {
	// TODO Rhea will need to be updated for CfgPatches name changing from "BRM_FRAMEWORK" to "BRM_FMK_main"
	class ADDON {
		name = CSTRING(component);
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		// For some reason, either of these crash the game when loading framework mission in Eden SP
		//requiredAddons[] = {"cba_main"};
		//requiredAddons[] = {"cba_main_a3"};
		requiredAddons[] = {};
		author = CSTRINGMAINS(Author);
		authors[] = {};
		url = CSTRINGMAINS(URL);
		VERSION_CONFIG;
	};
};

class CfgSettings {
	class CBA {
		class Versioning {
			class PREFIX {
				class Dependencies {
					CBA[] = {"cba_main", {3, 15, 8}, "true"};
				};
			};
		};
	};
};

#include "CfgNotifications.hpp"
#include "BRM_FMK_Endings.hpp"

class Extended_DisplayLoad_EventHandlers {
	class RscDisplayEGSpectator {
		ADDON = QUOTE([ARR_2(QQGVARMAIN(DisplayLoad_EGSpectator),_this)] call CBA_fnc_localEvent;);
	};
};

class Extended_DisplayUnload_EventHandlers {
	class RscDisplayEGSpectator {
		ADDON = QUOTE([ARR_2(QQGVARMAIN(DisplayUnload_EGSpectator),_this)] call CBA_fnc_localEvent;);
	};
};

class GVARMAIN(Loadouts) {
	class Factions {
		#include "loadouts\factions.hpp"
	};
	class Structures {
		#include "loadouts\structures.hpp"
	};
};
