params ["_unit", "_corpse"];

private _lives = [_unit] call BRM_FMK_RespawnSystem_fnc_getLives;

if (_lives == 0 || !mission_allow_respawn) then {
	if (_lives != 0) then {
		[_unit, 0] call BRM_FMK_RespawnSystem_fnc_setLives;
	};
	[_unit] call BRM_FMK_RespawnSystem_fnc_removeFromMission;
} else {
	_unit setVariable ["unit_deaths", (_unit getVariable ["unit_deaths", 0]) + 1, true];
	[_unit, _lives - 1] call BRM_FMK_RespawnSystem_fnc_setLives;
};
