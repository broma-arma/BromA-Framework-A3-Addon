if (!mission_ai_controller) exitWith {};

0 spawn {
	private _settings = [] call BRM_FMK_AIS_fnc_getSettings;
	if (_settings select 13/*aiSpawners*/ isEqualTo []) exitWith {};

	sleep 1; // After briefing

	publicVariable "BRM_FMK_AIS_garbageCollectorCheck";
	publicVariable "BRM_FMK_AIS_garbageCollector";
	publicVariable "BRM_FMK_AIS_eventReloaded";
	publicVariable "BRM_FMK_AIS_eventKilled";

	AIS_spawners = [];
	AIS_debug = !isMultiplayer;

	if (AIS_debug) then {
		0 spawn BRM_FMK_AIS_spawnersInfo;
	};

	{
		missionNamespace setVariable ["AIS_SPAWNER_" + _x, _forEachIndex];
	} forEach [
		"ID", "TYPE", "GROUPS", "SPAWN_COUNT", "SPAWN_LIMIT", "UNIT_TOTAL",
		"GROUP_TOTAL", "SIDE", "LOADOUT", "CLEANUP", "CONDITIONS",
		"CAMPS"
	];

	{
		missionNamespace setVariable ["AIS_" + _x, _settings select _forEachIndex];
	} forEach [
		"aiDeathSounds", "aiInfiniteAmmo", "aiSettingsAllMap", "cleanUpPlayerRadius", "stalkMaximumDistance", "garbageCollector",
		"garbageCollectorVehicle", "infantryCacheDistance", "vehicleCacheDistance", "spawnerSettings", "waypointSettings",
		"groupTypes", "aiSkills", "aiSpawners"
	];

	// public variables to be used by server side editor units
	publicVariable "AIS_garbageCollector";
	publicVariable "AIS_garbageCollectorVehicle";

	{
		private _fnc = missionNamespace getVariable format ["BRM_FMK_AIS_%1Spawner", _x select 0];
		if (!isNil "_fnc") then {
			_x select [1] spawn _fnc;
		} else {
			["[BrmFmk.AIS] Invalid spawner type in configuration: %1", _x select 0] call BIS_fnc_error;
		};
	} forEach AIS_aiSpawners;

	0 spawn BRM_FMK_AIS_applyToAllAi;
};
