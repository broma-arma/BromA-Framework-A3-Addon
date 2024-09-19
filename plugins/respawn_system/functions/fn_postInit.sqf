if (isServer) then {
	["BRM_FMK_taskStateChanged", {
		params ["_sideChar", "_id", "_state"];
		if (_state == "SUCCEEDED") then {
			[missionNamespace getVariable format ["side_%1_side", _sideChar], mission_respawn_objective] call BRM_FMK_RespawnSystem_fnc_callRespawnSide;
		}
	}] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
	["BRM_FMK_RespawnSystem_respawn", {
		if (player getVariable ["isDead", false]) then {
			player setVariable ["isDead", false, true];

			[player] call BRM_FMK_Engine_fnc_endSpectator;

			[{
				[player] joinSilent (player getVariable ["respawnGroup", ""] call BIS_fnc_groupFromNetId);
			}, [], 5] call CBA_fnc_waitAndExecute;
		};
	}] call CBA_fnc_addEventHandler;

	if (!player_is_spectator) then {
		[{ !isNil "mission_player_lives" }, {
			player addEventHandler ["Respawn", { _this call BRM_FMK_Plugin_RespawnSystem_fnc_onRespawn }];

			if ([player] call BRM_FMK_Plugin_RespawnSystem_fnc_getLives == 0) then {
				[player] call BRM_FMK_Plugin_RespawnSystem_fnc_removeFromMission;
			};
		},[]] call CBA_fnc_waitUntilAndExecute;
	};
};
