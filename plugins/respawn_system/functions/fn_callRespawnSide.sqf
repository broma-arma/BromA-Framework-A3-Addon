#include "script_component.hpp"
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
    [west, 5] call BRM_FMK_RespawnSystem_fnc_callRespawnSide;

    [side_a_side, 10, 1] call BRM_FMK_RespawnSystem_fnc_callRespawnSide;

RETURNS:
    Nothing.

================================================================================
*/

params ["_side", ["_amount", mission_respawn_objective], ["_lives", mission_player_lives]];

_amount = if (_amount > -1) then {
	_amount min count mission_dead_players
} else {
	count mission_dead_players
};

if (_amount == 0) exitWith {};

if (!isServer) exitWith {
	_this remoteExecCall [QFUNC(callRespawnSide), 2];
};

private _respawnedIndices = [];
for "_i" from 0 to _amount - 1 do {
	mission_dead_players select _i params ["_deadUID", "_deadName", "_deadSide"];

	if (_deadSide == _side) then {
		_respawnedIndices pushBack _i;

		private _unit = [_deadName] call FUNCMAIN(unitFromName);
		if (!isNull _unit) then {
			[_unit, _lives] call FUNC(setLives);
			[QGVAR(respawn), [], _unit] call CBA_fnc_targetEvent;
		};
	};
};

private _respawned = count _respawnedIndices;
for "_i" from _respawned - 1 to 0 step -1 do {
	mission_dead_players deleteAt (_respawnedIndices select _i);
};

if (_respawned > 0) then {
	publicVariable "mission_dead_players";

	(switch (_side) do {
		case WEST: { ["%1 %2 units have respawned.", "AlertBLU"] };
		case EAST: { ["%1 %2 units have respawned.", "AlertOP"] };
		case RESISTANCE: { ["%1 %2 units have respawned.", "AlertIND"] };
		case CIVILIAN: { ["%1 %2 units have respawned.", "Alert"] };
		default { ["%1 units have respawned.", "Alert"] }
	}) params ["_alertText", "_alertNotification"];

	[_alertNotification, [format [_alertText, _respawned, [_side, "name"] call FUNCMAIN(getSideInfo)]]] remoteExec ["BIS_fnc_showNotification", [0, -2] select isDedicated];
};
