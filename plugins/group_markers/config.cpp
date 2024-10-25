class BRM_FMK {
	class Plugins {
		class group_markers {
			name = "Group markers";
			version = 1;
			authors[] = {"Coryf88"};
			description = "Displays markers for player groups on map.";
			tag = "BRM_FMK_Plugin_GroupMarkers";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_GroupMarkers {
		class functions {
			file = "\broma_framework\plugins\group_markers\functions";
			class preInit {};
			class postInit {};
			class initMap {};
			class updateMarkers {};
			class handleDraw {};
			class artilleryComputer {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_GroupMarkers {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};

class Extended_DisplayLoad_EventHandlers {
	class RscDiary {
		BRM_FMK_Plugin_GroupMarkers = "params [""_display""]; if (ctrlIDD _display == 12) then { [_display displayCtrl 51] call BRM_FMK_Plugin_GroupMarkers_fnc_initMap; };";
	};
	class RscDisplayAVTerminal {
		BRM_FMK_Plugin_GroupMarkers = "params [""_display""]; [_display displayCtrl 51] call BRM_FMK_Plugin_GroupMarkers_fnc_initMap;";
	};
};
