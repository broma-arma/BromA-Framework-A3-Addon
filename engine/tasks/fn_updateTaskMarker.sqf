#include "script_component.hpp"
/*
================================================================================

NAME:
    BRM_FMK_fnc_updateTaskMarker

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Updates a task's marker position for an object.

PARAMETERS:
    0 - Task ID (STRING)
    1 - Object to track (OBJECT)
    2 - Min and max delay (ARRAY of NUMBER)

USAGE:
    [] call BRM_FMK_fnc_updateTaskMarker

RETURNS:
    Nothing.

================================================================================
*/

params [["_id", "", [""]], ["_obj", objNull, [objNull]], ["_delay", [60, 300], [[]], 2], ["_position", [], [[]]]];

if (_id == "" || isNull _obj) exitWith {};

if (!alive _obj) exitWith {
	[_id, getPos _obj] call BIS_fnc_taskSetDestination;
};

if (_position isNotEqualTo []) then {
	[_id, _position] call BIS_fnc_taskSetDestination;
};

[{ _this call FUNCMAIN(updateTaskMarker) }, [_id, _obj, _delay, getPosVisual _obj], _delay call BIS_fnc_randomNum] call CBA_fnc_waitAndExecute;
