/*
================================================================================

NAME:
    BRM_FMK_Plugin_RespawnSystem_fnc_callRespawn

AUTHOR(s):
    Nife

DESCRIPTION:
    Revives either a player who was previously dead, or any number of
    units.

PARAMETERS:
    0 - Who to revive - maybe either a STRING with a player's in-game name,
    the amount of players who will be revived,
    or a player OBJECT. (STRING/NUMBER/OBJECT)
    1 - (OPTIONAL) How many lives they will get. If left blank
    default parameter number will be used. (NUMBER)

USAGE:
    ["Nife", 2] call BRM_FMK_Plugin_RespawnSystem_fnc_callRespawn;

    [4] call BRM_FMK_Plugin_RespawnSystem_fnc_callRespawn;

RETURNS:
    Nothing.

================================================================================
*/

params ["_target", ["_lives", BRM_FMK_Plugin_RespawnSystem_lives]];

if (!isServer) exitWith {
	_this remoteExecCall ["BRM_FMK_Plugin_RespawnSystem_fnc_callRespawn", 2];
};

if (_target isEqualType objNull) exitWith {
	if (!isNull _target) then {
		private _dead = [getPlayerUID _target, name _target, _target call BIS_fnc_objectSide];
		if (!isNil { BRM_FMK_Plugin_RespawnSystem_deadPlayers deleteAt (BRM_FMK_Plugin_RespawnSystem_deadPlayers findIf { _x isEqualTo _dead }) }) then {
			[_target, _lives] call BRM_FMK_Plugin_RespawnSystem_fnc_setLives;
			["BRM_FMK_Plugin_RespawnSystem_respawn", [], _target] call CBA_fnc_targetEvent;
		};
	};
};

if (_target isEqualType "") exitWith {
	if (!isNil { BRM_FMK_Plugin_RespawnSystem_deadPlayers deleteAt (BRM_FMK_Plugin_RespawnSystem_deadPlayers findIf { _x select 1 == _target }) }) then {
		private _unit = [_target] call BRM_FMK_fnc_unitFromName;
		if (!isNull _unit) then {
			[_unit, _lives] call BRM_FMK_Plugin_RespawnSystem_fnc_setLives;
			["BRM_FMK_Plugin_RespawnSystem_respawn", [], _unit] call CBA_fnc_targetEvent;
		};
	};
};

if (_target isEqualType 0) exitWith {
	private _respawned = count BRM_FMK_Plugin_RespawnSystem_deadPlayers;
	if (_target >= 0) then {
		_respawned = _respawned min _target;
	};

	for "_i" from 0 to _respawned - 1 do {
		BRM_FMK_Plugin_RespawnSystem_deadPlayers select _i params ["_deadUID", "_deadName", "_deadSide"];

		private _unit = [_deadName] call BRM_FMK_fnc_unitFromName;
		if (!isNull _unit) then {
			[_unit, _lives] call BRM_FMK_Plugin_RespawnSystem_fnc_setLives;
			["BRM_FMK_Plugin_RespawnSystem_respawn", [], _unit] call CBA_fnc_targetEvent;
		};
	};
	BRM_FMK_Plugin_RespawnSystem_deadPlayers deleteRange [0, _respawned];

	if (_respawned > 0) then {
		["Alert", [format ["%1 units have respawned.", _respawned]]] remoteExec ["BIS_fnc_showNotification", [0, -2] select isDedicated];
	};
};

["[BrmFmk.RespawnSystem.callRespawn] Invalid target type: %1; expected STRING or SCALAR.", typeName _target] call BIS_fnc_error;
