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

if (!isNil { _unit getVariable "BRM_FMK_onAIKilled" }) exitWith {}; // TODO Is this needed?
_unit setVariable ["BRM_FMK_onAIKilled", true];

if ("f_remove_body" in usedPlugins) then {
	_unit spawn BRM_FMK_f_remove_body_fnc_removeBody; // TODO Use CBA events for this?
};

[_unit, _killer, _instigator, _useEffects] call BRM_FMK_fnc_handleScore;
[_unit, _killer, _instigator, _useEffects] call BRM_fnc_onAIKilled; // TODO Use CBA events for this?
