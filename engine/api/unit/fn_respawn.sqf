/*
================================================================================

NAME:
    BRM_FMK_fnc_respawn

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Respawn a specific player, a number of players, or a specific side.

PARAMETERS:
    0 - Player, player's in-game name, amount of players, or a side to revive. (OBJECT/STRING/NUMBER/SIDE)
    1 - (OPTIONAL) Varies depending on first parameter type: (NUMBER)
            OBJECT/STRING/NUMBER: How many lives they will get. Default mission parameter.
            SIDE: Amount of players to respawn. Default mission parameter.
    2 - (OPTIONAL) SIDE only: How many lives they will get. Default mission parameter. (NUMBER)

USAGE:
    [player] call BRM_FMK_fnc_respawn; // Respawn the player
    ["Nife"] call BRM_FMK_fnc_respawn; // Respawn a player named "Nife"
    [-1] call BRM_FMK_fnc_respawn; // Respawn all players
    [4] call BRM_FMK_fnc_respawn; // Respawn 4 players
    [side_a_side] call BRM_FMK_fnc_respawn; // Respawn players on Side A

    ["Nife", 2] call BRM_FMK_fnc_respawn; // Respawn a player named "Nife" with 2 lives
    [4, 1] call BRM_FMK_fnc_respawn; // Respawn 4 players with 1 life
    [BLUFOR, 5] call BRM_FMK_fnc_respawn; // Respawn 5 players on the BLUFOR side
    [side_a_side, 10, 1] call BRM_FMK_fnc_respawn; // Respawn 10 players on Side A with 1 life

RETURNS:
    Nothing.

================================================================================
*/

if ("respawn_system" call BRM_FMK_fnc_isPluginActive) exitWith {
	params ["_target"];

	if (_target isEqualType sideUnknown) exitWith {
		_this call BRM_FMK_Plugin_RespawnSystem_fnc_callRespawnSide;
	};

	_this call BRM_FMK_Plugin_RespawnSystem_fnc_callRespawn;
};

params ["_target"];

if (_target isEqualType objNull) exitWith {
	params ["_target"];

	if (!local _target) exitWith { _this remoteExecCall ["BRM_FMK_fnc_respawn", _x]; };

	setPlayerRespawnTime 0;
};

if (_target isEqualType 0 || _target isEqualType "" || _target isEqualType sideUnknown) exitWith {
	params ["_target", ["_amount", BRM_FMK_Plugin_RespawnSystem_respawnObjective]];

	private _condition = switch (typeName _target) do {
		case "STRING": {
			_amount = 1;
			{ !alive _x && _target == name _x }
		};
		case "SIDE": {
			if (_target call BIS_fnc_sideID > 3) exitWith {
				["Invalid side: %1", _target] call BIS_fnc_error; nil
			};
			{ !alive _x && _target == _x call BIS_fnc_objectSide }
		};
		default { // "SCALAR"
			_amount = _target;
			{ !alive _x }
		};
	};

	if (isNil "_condition") exitWith {};

	private _respawn = _amount;

	if (_amount < 1) exitWith {};
	{
		if (call _condition) then {
			[_x] + (_this select [1]) remoteExecCall ["BRM_FMK_fnc_respawn", _x];
			_amount = _amount - 1;
		};
		if (_amount < 1) exitWith {};
	} forEach allPlayers;

	if (_respawn - _amount > 0) then {
		private _template = "Alert";
		private _text = "%1 units have respawned.";
		private _side = if (_target isEqualType sideUnknown) then {
			_template = ["AlertOP", "AlertBLU", "AlertIND", "AlertCIV"] select (_target call BIS_fnc_sideID);
			_text = "%1 %2 units have respawned.";
			_target
		} else {
			sideUnknown
		};

		[_template, [format [_text, _respawn - _amount, [_side, "name"] call BRM_FMK_fnc_getSideInfo]]] remoteExec ["BIS_fnc_showNotification", [0, -2] select isDedicated];
	};
};

["Invalid target type: %1; expected OBJECT, STRING, SCALAR or SIDE.", typeName _target] call BIS_fnc_error;
