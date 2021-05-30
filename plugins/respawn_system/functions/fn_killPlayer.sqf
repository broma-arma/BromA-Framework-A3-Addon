params ["_unit"];

[_unit, 0] call BRM_FMK_RespawnSystem_fnc_setLives;
[_unit] call BRM_FMK_RespawnSystem_fnc_removeFromMission;
