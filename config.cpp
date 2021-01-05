#include "component.hpp"

class CfgPatches {
	class ADDON {
		author = "BromA";
		name = "Broma Framework";
		description = "Broma Framework MK 4 APEX";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {};
		VERSION_CONFIG;
	};
};

class CfgSettings {
	class CBA {
		class Versioning {
			class PREFIX {
				class dependencies {
					CBA_A3[] = { "cba_main", { 3, 15, 1 }, "true" };
				};
			};
		};
	};
};

class Extended_DisplayLoad_EventHandlers {
	class RscDisplayEGSpectator {
		PREFIX = "['BRM_FMK_DisplayLoad_EGSpectator', _this] call CBA_fnc_localEvent;";
	};
};

class Extended_DisplayUnload_EventHandlers {
	class RscDisplayEGSpectator {
		PREFIX = "['BRM_FMK_DisplayUnload_EGSpectator', _this] call CBA_fnc_localEvent;";
	};
};
