params ["_unit"];

private _playerID = getPlayerUID _unit;
private _index = mission_players_lives findIf { _x select 0 == _playerID };
if (_index != -1) exitWith {
	mission_players_lives select _index select 1
};

private _lives = switch (side _unit) do {
	case side_a_side: { mission_lives_side_a };
	case side_b_side: { mission_lives_side_b };
	case side_c_side: { mission_lives_side_c };
	default { -1 };
};
if (_lives < 0) then {
	_lives = mission_player_lives;
};
[_unit, _lives] call BRM_FMK_RespawnSystem_fnc_setLives;

_lives
