params ["_target", ["_lives", BRM_FMK_Plugin_RespawnSystem_playerLives]];

if (_target isEqualType "") then {
	_target = [_target] call BRM_FMK_fnc_unitFromName;
};

if (isNull _target) exitWith {};

if (!isServer) exitWith {
	[_target, _lives] remoteExecCall ["BRM_FMK_Plugin_RespawnSystem_fnc_setLives", 2];
};

private _playerID = getPlayerUID _target;
private _index = BRM_FMK_Plugin_RespawnSystem_playerLives findIf { _x select 0 == _playerID };
if (_index > -1) then {
	BRM_FMK_Plugin_RespawnSystem_playerLives select _index set [1, _lives];
} else {
	BRM_FMK_Plugin_RespawnSystem_playerLives pushBack [_playerID, _lives];
};
publicVariable "BRM_FMK_Plugin_RespawnSystem_playerLives";
