params ["_unit"];

private _playerID = getPlayerUID _unit;
private _index = BRM_FMK_Plugin_RespawnSystem_playerLives findIf { _x select 0 == _playerID };
if (_index != -1) exitWith {
	BRM_FMK_Plugin_RespawnSystem_playerLives select _index select 1
};

private _lives = switch (side _unit) do {
	case side_a_side: { BRM_FMK_Plugin_RespawnSystem_livesSideA };
	case side_b_side: { BRM_FMK_Plugin_RespawnSystem_livesSideB };
	case side_c_side: { BRM_FMK_Plugin_RespawnSystem_livesSideC };
	default { -1 };
};
if (_lives < 0) then {
	_lives = BRM_FMK_Plugin_RespawnSystem_lives;
};
[_unit, _lives] call BRM_FMK_Plugin_RespawnSystem_fnc_setLives;

_lives
