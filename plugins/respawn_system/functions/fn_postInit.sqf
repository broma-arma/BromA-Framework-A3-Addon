if (hasInterface) then {
    if (player_is_spectator) exitWith {};

    [{!(isNil "mission_player_lives")}, {
        player_current_lives = [player] call BRM_FMK_RespawnSystem_fnc_getLives;

        player addEventHandler ["Respawn", {[player] call BRM_FMK_RespawnSystem_fnc_onRespawn}];

        if (player_current_lives == 0) then { [player] call BRM_FMK_RespawnSystem_fnc_removeFromMission };
    },[]] call CBA_fnc_waitUntilAndExecute;
};