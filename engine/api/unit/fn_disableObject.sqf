/*
================================================================================

NAME:
    BRM_FMK_fnc_disableObject

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Hide and disable simulation of an object.

PARAMETERS:
    0 - Object (OBJECT)
    0 - Disable (BOOLEAN)

USAGE:
    [player, true] call BRM_FMK_fnc_disableObject

RETURNS:
   Nothing.

================================================================================
*/

params [["_object", objNull, [objNull]], ["_disable", false, [false]]];

if (isNull _object) exitWith {};

if (!isServer) exitWith { _this remoteExecCall ["BRM_FMK_fnc_disableObject", 2]; };

_object hideObjectGlobal _disable;
_object enableSimulationGlobal !_disable;
