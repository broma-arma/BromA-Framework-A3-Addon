#include "defines.inc"

params ["_init"];

private _configFile = "mission\settings\plugins\ai_spawner.sqf";
private _compat = 1;
if (_init == "postInitScript") then {
	_configFile = "mission\custom-scripts\ai_spawner\includes\configs.sqf";
	_compat = 0;
};

if (!fileExists _configFile) exitWith {};

if (_compat == 0) then {
	// Disable script version
	AIS_fnc_main = compileFinal "";
};

[{ !isNil "mission_AI_controller" && missionNamespace getVariable ["BRM_FMK_initialized", false] }, {
	if (mission_AI_controller) then {
		params ["_configFile", "_compat"];

		BRM_FMK_Plugin_AIS_spawnerSettings = createHashMapFromArray [
			["DEFAULT", [100, 100, false, false, [500, 2000], "DEFAULT"]],
			["ATTACK", [20, 100, false, true, false, "DEFAULT"]],
			["ATTACK_NOLAMBS", [20, 100, true, true, false, "DEFAULT"]]
		];

		BRM_FMK_Plugin_AIS_waypointSettings = createHashMapFromArray [
			["DEFAULT", [25, 50, "SAFE", "YELLOW", "FILE", "LIMITED", "", [0, 0, 0]]],
			["SAFE", [25, 50, "SAFE", "YELLOW", "FILE", "LIMITED", "", [0, 0, 0]]],
			["AWARE", [50, 100, "AWARE", "RED", "WEDGE", "FULL", "", [0, 0, 0]]],
			["DANGER", [50, 100, "COMBAT", "RED", "WEDGE", "FULL", "", [0, 0, 0]]]
		];

		BRM_FMK_Plugin_AIS_groupTypes = createHashMapFromArray [
			["DEFAULT", ["%1_Soldier_TL_F", "%1_Soldier_AR_F", "%1_Soldier_LAT_F", "%1_Soldier_F"]],

			["Squad", ["%1_Soldier_SL_F", "%1_medic_F", "%1_Soldier_F", "%1_soldier_M_F", "%1_Soldier_TL_F", "%1_Soldier_AR_F", "%1_Soldier_LAT_F", "%1_Soldier_F"]],
			["Team", ["%1_Soldier_TL_F", "%1_Soldier_AR_F", "%1_Soldier_LAT_F", "%1_Soldier_F"]],
			["Sentry", ["%1_Soldier_TL_F", ["%1_Soldier_LAT_F", "%1_Soldier_F", "%1_Soldier_F", "%1_Soldier_F"]]],

			["TRUCK", ["TRANSPORT_TRUCKS"]],
			["HELI", ["TRANSPORT_HELOS"]],
			["PLANE", ["TRANSPORT_PLANES"]],
			["BOAT", ["BOATS"]],
			["SUPPORT", ["SUPPORT"]],

			["LIGHT", ["LIGHT_VEHICLES"]],
			["MEDIUM", ["MEDIUM_VEHICLES"]],
			["HEAVY", ["HEAVY_VEHICLES"]],

			["AA", ["AA_VEHICLES"]],
			["AHELI", ["ATTACK_HELOS"]],
			["APLANE", ["ATTACK_PLANES"]],
			["ARTILLERY", ["MOBILE_ARTILLERY"]],
			["STATIC", ["STATIC_DEFENSE"]],
			["UAV", ["UAV"]],
			["UGV", ["UGV"]],
			["SUBMARINE", ["SUBMARINES"]],
			["MRAP", ["MRAP_VEHICLES"]]
		];

		BRM_FMK_Plugin_AIS_aiSkills = createHashMapFromArray [
			["DEFAULT", [
				["general", 1],
				["aimingAccuracy", 0.70],
				["aimingShake", 0.75],
				["aimingSpeed", 1],
				["endurance", 1],
				["spotDistance", 0.85],
				["spotTime", 1],
				["courage", 1],
				["reloadSpeed", 1],
				["commanding", 1]
			]]
		];

		BRM_FMK_Plugin_AIS_vehicleSeatsCache = createHashMap;
		BRM_FMK_Plugin_AIS_spawners = createHashMap;

		if (_compat == 0) then {
			call compile preprocessFileLineNumbers _configFile;

			{
				private _value = missionNamespace getVariable "AIS_" + _x;
				if (_x == "spawnerSettings") then {
					{
						_x params ["_id", "_settings"];
						_settings set [/*cleanup*/0, [-1, AIS_cleanUpPlayerRadius] select (_settings select /*cleanup*/0)];
						if !(_settings deleteAt /*caching*/4) then {
							_settings set [/*caching radius*/4, false];
						};
					} forEach _value;
				};
				missionNamespace getVariable "BRM_FMK_Plugin_AIS_" + _x merge [createHashMapFromArray _value, true];
			} forEach [
				"spawnerSettings", "waypointSettings", "groupTypes", "aiSkills"
			];

			BRM_FMK_Plugin_AIS_debug = missionNamespace getVariable ["AIS_debug", !isMultiplayer];

			AIS_fnc_defenseSpawner = {
				params [
					"_id", // "Defense Spawner", // id
					"_side", // east, // side
					"_zone", // zone_1, // trigger
					"_groups", // [["Infantry Team",2,"SAFE",10], ["Cars",2,"SAFE",5]], // Groups, 1- Group Type, 2- count, 3- Waypoint Settings, 4- Waypoint Count
					"_conditions", // [{(true)}, {(false)}], // conditions, 1- start  2- end

					"_loadout", // "CSAT", // loadout
					"_camps", // [[camp_1,"Infantry Team",5,5,200]], // camps, 1- position, 2- group type, 3- spawn count, 4- spawn delay, 5- distance to inactivate if players near
					"_settings" // "DEFAULT" // spawner settings
				];

				[
					"defend", _id, _side, _loadout, _settings, _zone, 5,
					_groups,
					[_camps],
					_conditions,
					[]
				] call BRM_FMK_AIS_fnc_createSpawner;
			};
			AIS_fnc_attackSpawner = {
				params [
					"_id", "_side", "_positions", "_groupType", "_conditions",
					"_groupCount", "_startDelay", "_waveDelay", "_loadout", "_waypointSettings",
					"_events", "_settings"
				];
				_conditions params ["_startCondition", "_endCondition"];

				if (_startDelay > 0) then {
					_startCondition = if (toString _startCondition regexReplace ["\W", ""] isNotEqualTo "true") then {
						[_startCondition, _startDelay]
					} else {
						_startDelay
					};
				};

				[
					"attack", _id, _side, _loadout, _settings, _positions select 1, _waveDelay,
					[[_groupType, _groupCount, _waypointSettings]],
					[_positions select 0],
					[_startCondition, _endCondition],
					_events apply { compile _x }
				] call BRM_FMK_AIS_fnc_createSpawner;
			};
			AIS_fnc_stalkSpawner = {
				params [
					"_id", "_side", "_positions", "_groupType", "_conditions",
					"_groupCount", "_startDelay", "_waveDelay", "_loadout", "_waypointSettings",
					"_events", "_settings"
				];
				_conditions params ["_startCondition", "_endCondition"];

				if (_startDelay > 0) then {
					 // Test isNotEqualTo ("{(true)}")
					_startCondition = if (_startCondition isNotEqualTo {(true)}) then {
						[_startCondition, _startDelay]
					} else {
						_startDelay
					};
				};

				[
					"stalk", _id, _side, _loadout, _settings, _positions select 1, _waveDelay,
					[[_groupType, _groupCount, _waypointSettings]],
					[AIS_stalkMaximumDistance],
					[_startCondition, _endCondition],
					_events apply { compile _x }
				] call BRM_FMK_AIS_fnc_createSpawner;
			};

			call compile (preprocessFileLineNumbers "mission\custom-scripts\ai_spawner\includes\spawners.sqf" regexReplace ["spawn\s+AIS_fnc_(defense|attack|stalk)Spawner", "call AIS_fnc_\1Spawner"]);
		} else {
			private _settings = call compile preprocessFileLineNumbers _configFile;
			private _configVersion = _settings select 0;
			if (_configVersion == 0) then {
				{
					if (_x == "") then { continue; };
					private _value = _settings select _forEachIndex;
					if (_x == "aiSpawners") then {
						{
							_x call BRM_FMK_AIS_fnc_createSpawner;
						} forEach _value;
					} else {
						missionNamespace getVariable "BRM_FMK_Plugin_AIS_" + _x merge [createHashMapFromArray _value, true];
					};
				} forEach [
					"", "spawnerSettings", "waypointSettings", "groupTypes", "aiSkills", "aiSpawners"
				];
			} else {
				["Unknown config version %1, in %2", _configVersion, _configFile] call BRM_FMK_fnc_error;
			};

			BRM_FMK_Plugin_AIS_debug = missionNamespace getVariable ["BRM_FMK_AIS_debug", !isMultiplayer];
		};

		BRM_FMK_Plugin_AIS_cacheManager_groups = createHashMap;

		[] call BRM_FMK_Plugin_AIS_fnc_spawnerManager;

		if (BRM_FMK_Plugin_AIS_debug) then {
			0 call BRM_FMK_Plugin_AIS_fnc_spawnersInfo;
		};
	};
}, [_configFile, _compat]] call CBA_fnc_waitUntilAndExecute;
