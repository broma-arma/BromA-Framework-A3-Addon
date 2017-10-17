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

if ("respawn_system" in usedPlugins) then {
	waitUntil { !isNil "BRM_FMK_RespawnSystem_fnc_killPlayer" };
	[_unit] call BRM_FMK_RespawnSystem_fnc_killPlayer;
} else {
	_unit setdamage 1;
};
