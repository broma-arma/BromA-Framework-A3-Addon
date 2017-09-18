/*
================================================================================

NAME:
    BRM_FMK_RespawnSystem_fnc_callRespawnSide

AUTHOR(s):
    Nife

DESCRIPTION:
    Revives either a player who was previously dead, or any number of
    units, filtered by side.

PARAMETERS:
    0 - Side to revive
    1 - Number of players
    2 - (OPTIONAL) Number of lives to give to players revived

USAGE:
    [west, 5] spawn BRM_FMK_RespawnSystem_fnc_callRespawnSide;

    [side_a_side, 10, 1] spawn BRM_FMK_RespawnSystem_fnc_callRespawnSide;

RETURNS:
    Nothing.

================================================================================
*/

params["_side", ["_amount", mission_respawn_objective], ["_lives", mission_player_lives]];
_am = _amount;

if (_amount == 0) exitWith {};

for "_i" from 0 to (_target - 1) do {
    if (_i >= (count _currentDeadList)) exitWith {};
    [((_currentDeadList select _i) select 1), _lives] call BRM_FMK_RespawnSystem_fnc_setLives;
    _amount = (_amount + 1);
};
mission_dead_players deleteRange [0, _target];

{
    _x params["_deadUID", "_deadName", "_deadSide"];
    if (_deadSide == _side) then {
        [_deadName, _lives] call BRM_FMK_RespawnSystem_fnc_setLives;
        _amount = _amount - 1;
    };
} forEach mission_dead_players;

private _totalRespawned = (_am -_amount);

mission_dead_players deleteRange [0, _totalRespawned];

private _alertProperties = switch (_side) do {
    case WEST: { ["%1 %2 units have respawned.", "AlertBLU"] };
    case EAST: { ["%1 %2 units have respawned.", "AlertOP"] };
    case RESISTANCE: { ["%1 %2 units have respawned.", "AlertIND"] };
    case CIVILIAN: { ["%1 %2 units have respawned.", "Alert"] };
    default { ["%1 units have respawned.", "Alert"] }
};

if (_totalRespawned > 0) then {
    [-1, {
        params["_side", "_totalRespawned", "_alertProperties"];
        _alertProperties params["_alertText", "_alertNotification"];
        private _sideName = [_side, "name"] call BRM_FMK_fnc_getSideInfo;

        [_alertNotification, [format [_alertText, _totalRespawned, _sideName]]] call BIS_fnc_showNotification;
    }, [_side, _totalRespawned, _alertProperties]] call CBA_fnc_globalExecute;
};

[{ publicVariable "mission_dead_players" },[], 5] call CBA_fnc_waitAndExecute;
