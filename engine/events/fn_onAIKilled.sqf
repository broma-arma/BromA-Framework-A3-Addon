/*
================================================================================

NAME:
    BRM_FMK_fnc_onAIKilled

AUTHOR(s):
    Nife

DESCRIPTION:
    Handles player killed events.

PARAMETERS:
    0 - Unit killed. (OBJECT)
    1 - Killer of the unit. (OBJECT)
    2 - Unit that pulled the trigger. (OBJECT)
    3 - Use destruction effects. (BOOL)

USAGE:
    Internal

RETURNS:
    Nothing.

================================================================================
*/

params ["_unit", "_killer", "_instigator", "_useEffects"];

_this call BRM_FMK_fnc_handleScore;
["BRM_FMK_aiKilled", _this] call CBA_fnc_localEvent;
if ("remove_body" in BRM_plugins) then {
	_unit spawn BRM_FMK_remove_body_fnc_removeBody; // TODO Use CBA events for this
};
_this call BRM_fnc_onAIKilled;
