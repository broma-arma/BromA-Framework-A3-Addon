private _livesSideA = -1;
private _livesSideB = -1;
private _livesSideC = -1;
private _respawnWave = [-1, -1, -1];

if (BRM_FMK_Engine_compatVersion == 0) then {
	if (!isNil "mission_lives_side_a") then { _livesSideA = mission_lives_side_a; };
	if (!isNil "mission_lives_side_b") then { _livesSideB = mission_lives_side_b; };
	if (!isNil "mission_lives_side_c") then { _livesSideC = mission_lives_side_c; };
	if (!isNil "mission_respawn_wave") then { _respawnWave = mission_respawn_wave; };
} else {
	if (fileExists "mission\settings\plugins\respawn_system.sqf") then {
		call compile preprocessFileLineNumbers "mission\settings\plugins\respawn_system.sqf";
	};
};

BRM_FMK_Plugin_RespawnSystem_livesSideA = _livesSideA;
BRM_FMK_Plugin_RespawnSystem_livesSideB = _livesSideB;
BRM_FMK_Plugin_RespawnSystem_livesSideC = _livesSideC;

BRM_FMK_Plugin_RespawnSystem_allowRespawn = ["p_allow_respawn", 0] call BIS_fnc_getParamValue > 0; // 0="Disabled", 1="Enabled"
BRM_FMK_Plugin_RespawnSystem_lives = ["p_player_lives", 3] call BIS_fnc_getParamValue; // 1="1", 3="3", 5="5",1 10="10"
BRM_FMK_Plugin_RespawnSystem_respawnObjective = ["p_respawn_objective", 10] call BIS_fnc_getParamValue; // 0="0", 3="3", 5="5", 10="10", 99="Everyone"

private _respawnWaveParam = ["p_respawn_wave", -1] call BIS_fnc_getParamValue; // -1="Mission", 0="Disable", 1="1", 2="2", 3="3", 4="4", 5="5", 10="10", 15="15", 20="20", 25="25", 30="30", 40="40", 50="50", 60="60"
if (_respawnWaveParam != -1) then {
	_respawnWave = _respawnWaveParam * 60;
};
if (_respawnWave isEqualType 0) then {
	_respawnWave = [_respawnWave, _respawnWave, _respawnWave];
};

if (isServer) then {
	["BRM_FMK_taskStateChanged", {
		params ["_sideChar", "_id", "_state"];
		if (_state == "SUCCEEDED") then {
			[missionNamespace getVariable format ["side_%1_side", _sideChar], BRM_FMK_Plugin_RespawnSystem_respawnObjective] call BRM_FMK_Plugin_RespawnSystem_fnc_callRespawnSide;
		}
	}] call CBA_fnc_addEventHandler;

	_respawnWave params [["_respawnWaveA", -1, [0]], ["_respawnWaveB", -1, [0]], ["_respawnWaveC", -1, [0]]];
	BRM_FMK_Plugin_RespawnSystem_respawnWavePFHs = [[side_a_side, _respawnWaveA, true], [side_b_side, _respawnWaveB, mission_game_mode != "coop"], [side_c_side, _respawnWaveC, mission_game_mode != "coop" && mission_enable_side_c]] apply {
		_x params ["_side", "_interval", "_condition"];
		if (_interval > 0 && _condition) then {
			[{ [_this select 0] call BRM_FMK_fnc_respawn; }, ceil _interval max 10, _side] call CBA_fnc_addPerFrameHandler;
		} else {
			-1
		}
	};
};

if (hasInterface) then {
	["BRM_FMK_Plugin_RespawnSystem_respawn", {
		if (player getVariable ["isDead", false]) then {
			player setVariable ["isDead", false, true];

			[false] call BRM_FMK_fnc_setSpectating;
			[player, true] call BRM_FMK_Engine_fnc_handleDeadGroup;
		};
	}] call CBA_fnc_addEventHandler;

	if !(player isKindOf "VirtualSpectator_F") then {
		player addEventHandler ["Respawn", { _this call BRM_FMK_Plugin_RespawnSystem_fnc_onRespawn }];

		if ([player] call BRM_FMK_Plugin_RespawnSystem_fnc_getLives == 0) then {
			[player] call BRM_FMK_Plugin_RespawnSystem_fnc_removeFromMission;
		};
	};
};
