BRM_FMK_Plugin_RespawnSystem_allowRespawn = ["p_allow_respawn", 0] call BIS_fnc_getParamValue > 0; // 0="Disabled", 1="Enabled"
BRM_FMK_Plugin_RespawnSystem_playerLives = ["p_player_lives", 3] call BIS_fnc_getParamValue; // 1="1", 3="3", 5="5",1 10="10"
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

	if (!player_is_spectator) then {
		player addEventHandler ["Respawn", { _this call BRM_FMK_Plugin_RespawnSystem_fnc_onRespawn }];

		if ([player] call BRM_FMK_Plugin_RespawnSystem_fnc_getLives == 0) then {
			[player] call BRM_FMK_Plugin_RespawnSystem_fnc_removeFromMission;
		};
	};
};
