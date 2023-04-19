#include "script_component.hpp"
/*
================================================================================

NAME:
    BRM_FMK_fnc_getSideInfo

AUTHOR(s):
    Nife

DESCRIPTION:
    Returns the relevant information about any side.

PARAMETERS:
    0 - Side whose information should be returned. (SIDE)
    1 - The type of information: "faction", "side", "color", "name", "skill", "callsigns", "units", "vehicles", "objects", or "dacCamps" (STRING)

USAGE:
    [west, "callsigns"] call BRM_FMK_fnc_getSideInfo;
    [east, "name"] call BRM_FMK_fnc_getSideInfo;
    [resistance, "faction"] call BRM_FMK_fnc_getSideInfo;

RETURNS:
    The requested information. (ANY)

================================================================================
*/

params [["_side", WEST, [WEST]], ["_info", "side", [""]]];

if (_side == CIVILIAN) exitWith { "CIVILIAN" };

_side = switch (_side) do {
	case side_a_side: { "a" };
	case side_b_side: { "b" };
	case side_c_side: { "c" };
	default           { "a" };
};

missionNamespace getVariable format ["side_%1_%2", _side, _info]
