/*
================================================================================

NAME:
    BRM_FMK_RespawnSystem_fnc_callRespawn

AUTHOR(s):
    Nife

DESCRIPTION:
    Revives either a player who was previously dead, or any number of
    units.

PARAMETERS:
    0 - Who to revive - maybe either a STRING with a player's in-game name,
    or the amount of players who will be revived.
    1 - (OPTIONAL) How many lives they will get. If left blank
    default parameter number will be used. (NUMBER)

USAGE:
    ["Nife", 2] call BRM_FMK_RespawnSystem_fnc_callRespawn;

    [4] call BRM_FMK_RespawnSystem_fnc_callRespawn;

RETURNS:
    Nothing.

================================================================================
*/

params ["_target", ["_lives", mission_player_lives]];

if (!isServer) exitWith {
	_this remoteExecCall ["BRM_FMK_RespawnSystem_fnc_callRespawn", 2];
};

if (_target isEqualType "") exitWith {
	if (!isNil { mission_dead_players deleteAt (mission_dead_players findIf { _x select 1 == _target }) }) then {
		publicVariable "mission_dead_players";

		private _unit = [_target] call BRM_FMK_fnc_unitFromName;
		if (!isNull _unit) then {
			[_unit, _lives] call BRM_FMK_RespawnSystem_fnc_setLives;
			["BRM_FMK_RespawnSystem_respawn", [], _unit] call CBA_fnc_targetEvent;
		};
	};
};

if (_target isEqualType 0) exitWith {
	private _respawned = count mission_dead_players;
	if (_target >= 0) then {
		_respawned = _respawned min _target;
	};

	for "_i" from 0 to _respawned - 1 do {
		mission_dead_players select _i params ["_deadUID", "_deadName", "_deadSide"];

		private _unit = [_deadName] call BRM_FMK_fnc_unitFromName;
		if (!isNull _unit) then {
			[_unit, _lives] call BRM_FMK_RespawnSystem_fnc_setLives;
			["BRM_FMK_RespawnSystem_respawn", [], _unit] call CBA_fnc_targetEvent;
		};
	};
	mission_dead_players deleteRange [0, _respawned];

	if (_respawned > 0) then {
		publicVariable "mission_dead_players";
		["Alert", [format ["%1 units have respawned.", _respawned]]] remoteExec ["BIS_fnc_showNotification", [0, -2] select isDedicated];
	};
};

["[BrmFmk.RespawnSystem.callRespawn] Invalid target type: %1; expected STRING or SCALAR.", typeName _target] call BIS_fnc_error;
