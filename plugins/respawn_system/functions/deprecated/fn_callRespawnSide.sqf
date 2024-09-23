/*
================================================================================

DEPRECATED:
    Use BRM_FMK_fnc_respawn.

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

_this call BRM_FMK_Plugin_RespawnSystem_fnc_callRespawn;
