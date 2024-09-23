/*
================================================================================

DEPRECATED:
    Use BRM_FMK_fnc_respawn.

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

_this call BRM_FMK_Plugin_RespawnSystem_fnc_callRespawn;
