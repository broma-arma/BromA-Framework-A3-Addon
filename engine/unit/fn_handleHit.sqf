/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_handleHit

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Unit hit event handler.

PARAMETERS:
    0 - Object the event handler is assigned to (OBJECT)
    1 - Object that killed the unit. Contains the unit itself in case of collisions. (OBJECT)
    2 - Person who pulled the trigger (OBJECT)

USAGE:
    [player, myKiller] call BRM_FMK_Engine_fnc_handleHit;

RETURNS:
    Nothing.

================================================================================
*/

params ["_unit", "_source", "_damage", "_instigator"];

if (isNull _instigator) then {
	_instigator = _killer;

	// Handle UAV road kill (Note: unitIsUAV doesn't work for UAV AI)
	if (_instigator isKindOf "CAManBase" && { getText (configOf _instigator >> "simulation") == "UAVPilot"}) then { _instigator = vehicle _instigator; };
	if (unitIsUAV _instigator) then { _instigator = UAVControl _instigator select 0; };
};

_unit setVariable ["last_damage", _instigator];
