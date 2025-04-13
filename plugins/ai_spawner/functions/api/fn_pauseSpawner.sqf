#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_AIS_fnc_pauseSpawner

Description:
	Pause, unpause, or toggle a spawner.

Parameters:
	_id - Spawner ID [STRING]
	_pause - true to pause, false to unpause, nil to toggle [BOOLEAN, defaults to nil]

Returns:
	Nothing

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

if (!mission_ai_controller) exitWith {};

params [
	["_id", "", [""]],
	["_pause", nil, [true]]
];

if (_id == "") exitWith { ["Empty spawner ID"] call BRM_FMK_fnc_error; };

private _spawner = GET_SPAWNER(_id);
if (isNil "_spawner") exitWith { ["Unknown spawner ID: %1", _id] call BRM_FMK_fnc_error; };

if (isNil "_pause") then {
	private _pause = _spawner get "pause";
	_pause = if (_pause isEqualType 0) then { false } else { !_pause };
};

_spawner set ["pause", _pause];
