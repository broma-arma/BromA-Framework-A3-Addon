#include "script_component.hpp"
/*
================================================================================

NAME:
    BRM_FMK_fnc_onPlayerRespawn

AUTHOR(s):
    Nife

DESCRIPTION:
    Handles player respawn events.

PARAMETERS:
    0 - Unit killed. (OBJECT)
    1 - Killer of said unit. (OBJECT)

USAGE:
    Internal

RETURNS:
    Nothing.

================================================================================
*/

params ["_unit", "_corpse"];

[QGVARMAIN(playerRespawn), _this] call CBA_fnc_localEvent;
_this call BRM_fnc_onPlayerRespawn;
