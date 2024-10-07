private _livesSideA = -1;
private _livesSideB = -1;
private _livesSideC = -1;

if (BRM_FMK_Engine_compatVersion == 0) then {
	if (!isNil "mission_lives_side_a") then { _livesSideA = mission_lives_side_a; };
	if (!isNil "mission_lives_side_b") then { _livesSideB = mission_lives_side_b; };
	if (!isNil "mission_lives_side_c") then { _livesSideC = mission_lives_side_c; };
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

if (isServer) then {
	["BRM_FMK_taskStateChanged", {
		params ["_sideChar", "_id", "_state"];
		if (_state == "SUCCEEDED") then {
			[missionNamespace getVariable format ["side_%1_side", _sideChar], BRM_FMK_Plugin_RespawnSystem_respawnObjective] call BRM_FMK_Plugin_RespawnSystem_fnc_callRespawnSide;
		}
	}] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
	["BRM_FMK_Plugin_RespawnSystem_respawn", {
		if (player getVariable ["isDead", false]) then {
			player setVariable ["isDead", false, true];

			[false] call BRM_FMK_fnc_setSpectating;

			[{
				[player] joinSilent (player getVariable ["respawnGroup", ""] call BIS_fnc_groupFromNetId);
			}, [], 5] call CBA_fnc_waitAndExecute;
		};
	}] call CBA_fnc_addEventHandler;

	if !(player isKindOf "VirtualSpectator_F") then {
		player addEventHandler ["Respawn", { _this call BRM_FMK_Plugin_RespawnSystem_fnc_onRespawn }];

		if ([player] call BRM_FMK_Plugin_RespawnSystem_fnc_getLives == 0) then {
			[player] call BRM_FMK_Plugin_RespawnSystem_fnc_removeFromMission;
		};
	};
};
