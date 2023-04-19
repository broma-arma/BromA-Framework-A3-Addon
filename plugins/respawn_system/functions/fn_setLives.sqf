#include "script_component.hpp"
params ["_target", ["_lives", mission_player_lives]];

if (_target isEqualType "") then {
	_target = [_target] call FUNCMAIN(unitFromName);
};

if (isNull _target) exitWith {};

if (!isServer) exitWith {
	[_target, _lives] remoteExecCall [QFUNC(setLives), 2];
};

private _playerID = getPlayerUID _target;
private _index = mission_players_lives findIf { _x select 0 == _playerID };
if (_index > -1) then {
	mission_players_lives select _index set [1, _lives];
} else {
	mission_players_lives pushBack [_playerID, _lives];
};
publicVariable "mission_players_lives";
