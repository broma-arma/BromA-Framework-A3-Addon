params["_target", ["_lives", mission_player_lives]];

private _found = false;
private _index = -1;

_target = if (typeName _target == "OBJECT") then { (name _target) } else { _target };

{
    if ( ((_x select 1) == (_target)) ) exitWith { _found = true; _index = _forEachindex };
} forEach mission_players_lives;

if (_found) then {
    mission_players_lives set [_index, [(mission_players_lives select _index) select 0, _target, _lives]];
    publicVariable "mission_players_lives";
};

_index
