private["_gear"];

_unit = _this select 0;

_gear = [player] call BRM_FMK_fnc_getGear;

player setVariable ["unit_respawn_gear", _gear, true];

if (mission_TFAR_enabled) then {
    _unit setVariable ["tf_unable_to_use_radio", true];
};

sleep 1;

removeVest _unit;
removeHeadgear _unit;
removeBackpack _unit;
removeGoggles _unit;
removeUniform _unit;
removeAllItems _unit;
removeAllWeapons _unit;

_oldgrp = group _unit;

_unit setVariable ["isDead", true, true];
[_unit] joinSilent grpnull;

[_unit] call BRM_FMK_fnc_initSpectator;

sleep 10;

waitUntil
    {
        sleep 5;
        !([getPlayerUID _unit, name _unit, (_unit getVariable "unit_side")] in mission_dead_players)
    };

player setVariable ["isDead", false, true];

_rGear = player getVariable ["unit_respawn_gear", []];

[player, _rGear] call BRM_FMK_fnc_setGear;

[_unit] joinSilent _oldgrp;

_respawn = [_unit] call BRM_FMK_fnc_getSpawnPoint;

_unit setPos getMarkerPos _respawn;

[_unit] call BRM_FMK_fnc_endSpectator;