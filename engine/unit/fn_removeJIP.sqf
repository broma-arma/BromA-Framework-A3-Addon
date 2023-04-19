#include "script_component.hpp"
/*
================================================================================

NAME:
    BRM_FMK_fnc_removeJIP

AUTHOR(s):
    Nife

DESCRIPTION:
    Displays a message to any players who aren't allowed to Join in Progress.

PARAMETERS:
    0 - Player (OBJECT)

USAGE:
    [player] spawn BRM_FMK_fnc_removeJIP

RETURNS:
    Nothing.

================================================================================
*/

params ["_unit"];

titleText ["This mission does not allow joining in progress.", "BLACK FADED", 0];
sleep 5;

if ("respawn_system" in BRM_plugins) then {
	waitUntil { !isNil QEFUNC(RespawnSystem,killPlayer) };
	[_unit] call EFUNC(RespawnSystem,killPlayer);
} else {
	_unit setdamage 1;
};
