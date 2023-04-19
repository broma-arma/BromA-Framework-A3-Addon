#include "script_component.hpp"
diag_log text format ["%1: %2", _fnc_scriptName, _this];

["BRM_FMK_aiControllerInit", {
	0 spawn {
		private _settings = [] call BRM_FMK_AIS_fnc_getSettings;
		if (_settings select 13/*aiSpawners*/ isEqualTo []) exitWith {};

		sleep 1; // After briefing

		BRM_FMK_AIS_spawners = createHashMap;
		BRM_FMK_AIS_debug = !isMultiplayer;
		BRM_FMK_AIS_vehicleSeatsCache = createHashMap;

		if (BRM_FMK_AIS_debug) then {
			0 spawn BRM_FMK_AIS_fnc_spawnersInfo;
		};

		{
			missionNamespace setVariable ["BRM_FMK_AIS_SPAWNER_" + _x, _forEachIndex];
		} forEach [
			"ID", "TYPE", "GROUPS", "SPAWN_COUNT", "SPAWN_LIMIT", "UNIT_TOTAL",
			"GROUP_TOTAL", "SIDE", "LOADOUT", "CLEANUP", "CONDITIONS",
			"CAMPS"
		];

		{
			private _value = _settings select _forEachIndex;
			if (_x in ["spawnerSettings", "waypointSettings", "groupTypes", "aiSkills"]) then {
				_value = createHashMapFromArray _value;
			};
			missionNamespace setVariable ["BRM_FMK_AIS_" + _x, _value];
		} forEach [
			"aiDeathSounds", "aiInfiniteAmmo", "aiSettingsAllMap", "cleanUpPlayerRadius", "stalkMaximumDistance", "garbageCollector",
			"garbageCollectorVehicle", "infantryCacheDistance", "vehicleCacheDistance", "spawnerSettings", "waypointSettings",
			"groupTypes", "aiSkills", "aiSpawners"
		];

		// public variables to be used by server side editor units
		publicVariable "BRM_FMK_AIS_garbageCollector";
		publicVariable "BRM_FMK_AIS_garbageCollectorVehicle";

		{
			/*private _fnc = missionNamespace getVariable format ["BRM_FMK_AIS_fnc_%1Spawner", _x select 0];
			if (!isNil "_fnc") then {
				// TODO Arma v2.14 `_x select [1]`
				_x select [1, count _x - 1] spawn _fnc;
			} else {
				["[BrmFmk.AIS] Invalid spawner type in configuration: %1", _x select 0] call BIS_fnc_error;
			};*/

			_x spawn BRM_FMK_AIS_fnc_spawner;
		} forEach BRM_FMK_AIS_aiSpawners;

		0 spawn BRM_FMK_AIS_fnc_applyToAllAi;
	};
}] call CBA_fnc_addEventHandler;
