params["_unit"];
[{(alive _this)}, {
    player_current_lives = [_this] call BRM_FMK_RespawnSystem_fnc_getLives;

    if (((player_current_lives) == 0) || !(mission_allow_respawn)) then {
        [_this, 0] call BRM_FMK_RespawnSystem_fnc_setLives;

        mission_dead_players pushBack [(getPlayerUID _this), (name _this),(_this getVariable "unit_side")];
        publicVariable "mission_dead_players";

        [_this] call BRM_FMK_RespawnSystem_fnc_removeFromMission;
    } else {
        _this setVariable ["unit_deaths", (_this getVariable ["unit_deaths",0]) + 1, true];
        [_this, (player_current_lives - 1)] call BRM_FMK_RespawnSystem_fnc_setLives;
        player_current_lives = (player_current_lives - 1);
    };
}, _unit] call CBA_fnc_waitUntilAndExecute;
