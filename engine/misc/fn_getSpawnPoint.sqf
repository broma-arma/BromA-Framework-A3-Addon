/*
================================================================================

NAME:
    BRM_FMK_fnc_getSpawnPoint

AUTHOR(s):
    Nife

DESCRIPTION:
    Returns the unit's respawn point based on its side.

PARAMETERS:
    0 - Unit (OBJECT)

USAGE:
    _myRespawn = [player] call BRM_FMK_fnc_getSpawnPoint

RETURNS:
    Respawn point name. (STRING)

================================================================================
*/

params ["_unit"];

switch (_unit call BIS_fnc_objectSide) do {
	case WEST:       { "respawn_west" };
	case EAST:       { "respawn_east" };
	case RESISTANCE: { "respawn_resistance" };
	case CIVILIAN:   { "respawn_civilian" };
	default          { "respawn_west" };
};
