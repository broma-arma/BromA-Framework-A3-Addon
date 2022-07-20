/*
================================================================================

NAME:
    BRM_fnc_engine_pre

AUTHOR(s):
    Nife

DESCRIPTION:
    Starts loading the framework.

PARAMETERS:
    None.

USAGE:
    PreInit

RETURNS:
    Nothing.

================================================================================
*/

if (!isNil "BRM_FMK_pre") exitWith {};
BRM_FMK_pre = true;

if (fileExists "framework\local_version.txt") then { // Mission <= v0.7.5
	private _localVersion = call compile preprocessFileLineNumbers "framework\local_version.txt" splitString "" apply { parseNumber _x };
	for "_i" from count _localVersion to 3 do {
		_localVersion pushBack 0;
	};
	BRM_version = _localVersion;
};

private _cfgMissionVersion = missionConfigFile >> "BRM_Framework" >> "mission_version";
if (isArray _cfgMissionVersion) then { // Mission > v0.7.5
	BRM_version = getArray _cfgMissionVersion;
};

if (isNil "BRM_version") exitWith {}; // Not a BromA Framework mission

if ([BRM_version, [0, 7, 5]] call BRM_FMK_fnc_versionCompare <= 0) then {
	[{ !isNil "mission_settings" && { scriptDone mission_settings } }, {
		if (!mission_enable_side_c) then {
			side_c_faction = "";
		};

		mission_loadout_mods = modified_loadouts;
		mission_loadout_vanillaPlayer = units_player_useVanillaGear;
		mission_loadout_vanillaAI = units_AI_useVanillaGear;

		// This isn't quite correct, but should handle most missions.
		if (units_player_useVanillaGear) then {
			side_a_faction = "VANILLA";
		};
		if (units_AI_useVanillaGear) then {
			side_b_faction = "VANILLA";
			if (side_c_faction != "") then {
				side_c_faction = "VANILLA";
			};
		};
	}] call CBA_fnc_waitUntilAndExecute;
} else {
	[] call BRM_FMK_fnc_initVariables;

	if (hasInterface) then {
		// Remove side-specific markers
		private _playerSide = side player;
		{
			_x params ["_side", "_layerName"];

			if (_playerSide != _side) then {
				{
					deleteMarkerLocal _x;
				} forEach (getMissionLayerEntities _layerName select 1);
			};
		} forEach [[WEST, "BLU"], [EAST, "OP"], [RESISTANCE, "IND"], [CIVILIAN, "CIV"]];
	};

	private _fnc_playableMissionEntities = {
		params ["_includeLogic", true, [true]];

		private _entities = [];

		private _cfgEntities = missionConfigFile >> "Mission" >> "Mission" >> "Entities";
		private _items = getNumber (_cfgEntities >> "items");
		for "_i" from 0 to _items - 1 do {
			private _cfgItem = _cfgEntities >> format ["Item%1", _i];
			private _dataType = getText (_cfgItem >> "dataType");
			if (_dataType == "Group") then {
				private _cfgGroupEntities = _cfgItem >> "Entities";
				private _items = getNumber (_cfgGroupEntities >> "items");
				for "_i" from 0 to _items - 1 do {
					private _cfgAttributes = _cfgGroupEntities >> format ["Item%1", _i] >> "Attributes";
					if (getNumber (_cfgAttributes >> "isPlayable")) then {
						_entities pushBack [getText (_cfgAttributes >> "type"), getText (_cfgAttributes >> "name")];
					};
				};
			} else {
				if (_includeLogic && _dataType == "Logic") then {
					if (getNumber (_cfgItem >> "isPlayable") > 0) then {
						_entities pushBack [getText (_cfgItem >> "type"), getText (_cfgItem >> "name")];
					};
				};
			};
		};

		_entities
	};

	// TODO Remove execVM usage
	mission_settings = 0 spawn {
		mission_settings_loaded = false;
		call compile preprocessFileLineNumbers "mission\settings\mission-settings.sqf";

		mission_enable_side_c = side_c_faction != "";

		if (mission_extraction_tracks isEqualTo "*") then {
			mission_extraction_tracks = [] call BRM_FMK_fnc_getMusic;
		};
		mission_extraction_enable_music = mission_extraction_tracks isEqualType [] && {count mission_extraction_tracks > 0};

		if (isNil "DAC_Res_Side") then {
			private _cfgIntel = missionConfigFile >> "Mission" >> "Mission" >> "Intel";
			private _resistanceWest = if (isNumber (_cfgIntel >> "resistanceWest")) then { getNumber (_cfgIntel >> "resistanceEast") } else { 1 };
			private _resistanceEast = getNumber (_cfgIntel >> "resistanceEast");
			if (_resistanceWest == 0) then {
				_resistanceEast = 1 - _resistanceEast;
			};
			// Independent friendly to: 0 = EAST, 1 = WEST, 2 = NONE, 3 = BOTH
			DAC_Res_Side = [_resistanceWest, _resistanceEast] call BIS_fnc_encodeFlags2;
		};

		if (mission_extraction_BLU isEqualTo "*" || mission_extraction_OP isEqualTo "*" || mission_extraction_IND isEqualTo "*" || mission_extraction_CIV isEqualTo "*") then {
			private _squadNames = ["GroupCompany", "GroupPlatoon", "GroupSquad"] apply {
				private _names = "true" configClasses (configfile >> "CfgWorlds" >> _x) apply { getText (_x >> "name") };
				[count _names, _names]
			};

			// Get all group variables
			private _sideStrs = ["West", "East", "Independent", "Civilian"];
			private _sideSquadNameIndexes = [[0, 0, -1], [0, 0, -1], [0, 0, -1], [0, 0, -1]];
			private _groupVars = [[], [], [], []];
			private _cfgEntities = missionConfigFile >> "Mission" >> "Mission" >> "Entities";
			private _items = getNumber (_cfgEntities >> "items");
			for "_i" from 0 to _items - 1 do {
				private _cfgItem = _cfgEntities >> format ["Item%1", _i];
				private _dataType = getText (_cfgItem >> "dataType");
				if (_dataType == "Group") then {
					private _squadName = call {
						// CBA custom squad names
						private _squadName = "";
						private _cfgCustomAttributes = _cfgItem >> "CustomAttributes";
						private _nAttributes = getNumber (_cfgCustomAttributes >> "nAttributes");
						for "_i" from 0 to _nAttributes - 1 do {
							private _cfgAttribute = _cfgCustomAttributes >> format ["Attribute%1", _i];
							if (getText (_cfgAttribute >> "property") == "groupID") exitWith {
								_squadName = getText (_cfgAttribute >> "Value" >> "data" >> "value");
							};
						};
						if (_squadName != "") exitWith { _squadName };

						// Vanilla squad names
						private _indexes = _sideSquadNameIndexes select _sideIndex;
						for "_i" from count _squadNames - 1 to 0 step -1 do {
							_indexes set [_i, _indexes # _i + 1];
							if (_indexes select _i < _squadNames select _i select 0) exitWith {};
							if (_i == 0) then {
								// Default names would allow 599 combinations; only 288 groups can exist per side.
								// Throw an error just in case it occurs.
								["[BromA Framework] Error: Too many groups, not enough name combinations"] call BIS_fnc_error;
							} else {
								_indexes set [_i, 0];
							};
						};

						private _squadNameParts = [];
						for "_i" from 0 to 2 do {
							_squadNameParts pushBack (_squadNames select _i select 1 select (_indexes select _i));
						};
						format (["%1 %2-%3"] + _squadNameParts) // "%GroupCompany %GroupPlatoon-%GroupSquad"
					};
					private _sideIndex = _sideStrs find getText (_cfgItem >> "side");
					private _cfgAttributes = _cfgItem >> "Attributes";
					if (isClass _cfgAttributes) then {
						_groupVars select _sideIndex pushBack getText (_cfgAttributes >> "name");
					} else { // Create group variable
						["[BromA Framework] Error: Group ""%1"" doesn't have a variable name.", _squadName] call BIS_fnc_error;
					};
				};
			};

			if (mission_extraction_BLU isEqualTo "*") then {
				mission_extraction_BLU = _groupVars select 0;
			};
			if (mission_extraction_OP isEqualTo "*") then {
				mission_extraction_OP = _groupVars select 1;
			};
			if (mission_extraction_IND isEqualTo "*") then {
				mission_extraction_IND = _groupVars select 2;
			};
			if (mission_extraction_CIV isEqualTo "*") then {
				mission_extraction_CIV = _groupVars select 3;
			};
		};

		DAC_STRPlayers = [false] call _fnc_playableMissionEntities apply { _x select 1 };

		[] call BRM_FMK_fnc_assignSideProperties;
		mission_settings_loaded = true;
	};

	if (isServer) then {
		mission_objectives = 0 spawn { // Needs to be done after mission-settings.sqf and BRM_FMK_fnc_createPlayerVehicles (PostInit)
			waitUntil { scriptDone(mission_settings) && !isNil "server_vehicles_created" };
			[] call compile preprocessFileLineNumbers "mission\objectives\tasks.sqf";

			[] spawn BRM_FMK_fnc_checkTasks
		};
	};

	mission_init_enemies = 0 spawn { // mission_AI_controller (headless_client plugin PostInit) and BRM_fnc_logPlugins (PostInit)
		waitUntil { !isNil "mission_AI_controller" && time > 5 };

		if (mission_AI_controller) then {
			[] call compile preprocessFileLineNumbers "mission\objectives\mission_AI.sqf";
		};
	};

	BRM_fnc_onAIKilled = compile preprocessFileLineNumbers "mission\events\onAIKilled.sqf";
	BRM_fnc_onPlayerKilled = compile preprocessFileLineNumbers "mission\events\onPlayerKilled.sqf";
	BRM_fnc_onPlayerRespawn = compile preprocessFileLineNumbers "mission\events\onPlayerRespawn.sqf";
};

["LOCAL", "F_LOG", ""] call BRM_FMK_fnc_doLog;
["LOCAL", "F_LOG", format ["STARTING MISSION '%1'", briefingName]] call BRM_FMK_fnc_doLog;
["LOCAL", "F_LOG", ""] call BRM_FMK_fnc_doLog;

startTime = diag_tickTime;
pluginsLoaded = false;

BRM_FMK_plugins = "true" configClasses (configFile >> "BRM_FMK_Plugins") apply { configName _x };
BRM_FMK_plugins sort true;

if ([BRM_version, [0, 7, 5]] call BRM_FMK_fnc_versionCompare <= 0) then {
	BRM_plugins = "true" configClasses (missionConfigFile >> "CfgPlugins") apply { configName _x };
	BRM_plugins sort true;

	{
		missionNamespace setVariable _x;
	} forEach [
		["BRM_FMK_f_cas_cap_fnc_postinit", "BRM_FMK_casualties_cap_fnc_postinit"],
		["BRM_FMK_f_remove_body_fnc_postinit", "BRM_FMK_remove_body_fnc_postinit"],
		["BRM_FMK_f_remove_body_fnc_removeBody", "BRM_FMK_remove_body_fnc_removeBody"],
		["BRM_FMK_f_evade_escape_fnc_reachObject", "BRM_FMK_evade_escape_fnc_reachObject"]

	];
} else {
	private _plugins = call compile preprocessFileLineNumbers "mission\settings\plugins.sqf";
	private _unknownPlugins = _plugins apply { _x select 0 } select { !(_x in BRM_FMK_plugins) };
	if (count _unknownPlugins > 0) then {
		["[BromA Framework] Warning: The mission contains unknown plugins in ""mission\settings\plugins.sqf"", %1.", _unknownPlugins joinString ", "] call BIS_fnc_error;
	};

	BRM_plugins = [];
	{
		if ([_plugins, _x, getNumber (configFile >> "BRM_FMK_Plugins" >> _x >> "disabled") == 0] call BIS_fnc_getFromPairs) then {
			BRM_plugins pushBack _x;
		};
	} forEach BRM_FMK_plugins;

	private _preInitArgs = ["preInit"];
	{
		private _plugin = _x;
		{
			if (!isNil _x) then {
				_preInitArgs call (missionNamespace getVariable _x);
			} else {
				["[BromA Framework] Internal Error: Unknown ""%2"" plugin preInit function, %2.", _plugin, _x] call BIS_fnc_error;
			};
		} forEach getArray (configFile >> "BRM_FMK_Plugins" >> _plugin >> "preInit");
	} forEach BRM_plugins;
};
