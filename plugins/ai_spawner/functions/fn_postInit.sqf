if (!mission_ai_controller) exitWith {};

0 spawn {
	private _settings = [] call BRM_FMK_AIS_fnc_getSettings;
	if (_settings select 13/*aiSpawners*/ isEqualTo []) exitWith {};

	sleep 1; // After briefing

	BRM_FMK_AIS_spawners = [];
	BRM_FMK_AIS_debug = !isMultiplayer;

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
		missionNamespace setVariable ["BRM_FMK_AIS_" + _x, _settings select _forEachIndex];
	} forEach [
		"aiDeathSounds", "aiInfiniteAmmo", "aiSettingsAllMap", "cleanUpPlayerRadius", "stalkMaximumDistance", "garbageCollector",
		"garbageCollectorVehicle", "infantryCacheDistance", "vehicleCacheDistance", "spawnerSettings", "waypointSettings",
		"groupTypes", "aiSkills", "aiSpawners"
	];

	// public variables to be used by server side editor units
	publicVariable "BRM_FMK_AIS_garbageCollector";
	publicVariable "BRM_FMK_AIS_garbageCollectorVehicle";

	{
		private _fnc = missionNamespace getVariable format ["BRM_FMK_AIS_fnc_%1Spawner", _x select 0];
		if (!isNil "_fnc") then {
			_x select [1] spawn _fnc;
		} else {
			["[BrmFmk.AIS] Invalid spawner type in configuration: %1", _x select 0] call BIS_fnc_error;
		};
	} forEach BRM_FMK_AIS_aiSpawners;

	0 spawn BRM_FMK_AIS_fnc_applyToAllAi;
};
