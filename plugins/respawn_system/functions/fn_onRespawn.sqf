params ["_unit", "_corpse"];

private _lives = [_unit] call BRM_FMK_Plugin_RespawnSystem_fnc_getLives;

if (_lives == 0 || !BRM_FMK_Plugin_RespawnSystem_allowRespawn) then {
	if (_lives != 0) then {
		[_unit, 0] call BRM_FMK_Plugin_RespawnSystem_fnc_setLives;
	};
	[_unit] call BRM_FMK_Plugin_RespawnSystem_fnc_removeFromMission;
} else {
	[_unit, _lives - 1] call BRM_FMK_Plugin_RespawnSystem_fnc_setLives;
};
