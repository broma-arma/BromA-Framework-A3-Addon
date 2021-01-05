#include "component.hpp"

params["_unit"];

private _playerID = getPlayerUID _unit;
private _found = false;
private _index = 0;

private _unitLives = switch (true) do {
    case ((side _unit == side_a_side) && (mission_lives_side_a > -1)): { mission_lives_side_a };
    case ((side _unit == side_b_side) && (mission_lives_side_b > -1)): { mission_lives_side_b };
    case ((side _unit == side_c_side) && (mission_lives_side_c > -1)): { mission_lives_side_c };
    default { mission_player_lives };
};

{
    if ((_x select 0) == (_playerID)) exitWith { _found = true; _index = _forEachindex };
} forEach mission_players_lives;

private _returnValue = if (_found) then {
    (((mission_players_lives) select _index) select 2)
} else {
    mission_players_lives pushBack [_playerID, name _unit, _unitLives];
    publicVariable "mission_players_lives";

    ((mission_players_lives select _index) select 2);
};

_returnValue
