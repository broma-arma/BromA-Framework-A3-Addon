#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_AIS_fnc_isSpawnerPaused

Description:
	Get if a spawner is paused.

Parameters:
	_id - Spawner ID [STRING]

Returns:
	true if the spawner is paused, otherwise false [BOOLEAN]

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

if (!mission_ai_controller) exitWith {};

params [
	["_id", "", [""]]
];

if (_id == "") exitWith { ["Empty spawner ID"] call BRM_FMK_fnc_error; };

private _spawner = GET_SPAWNER(_id);
if (isNil "_spawner") exitWith { ["Unknown spawner ID: %1", _id] call BRM_FMK_fnc_error; };

_spawner get "pause" isEqualTo true
