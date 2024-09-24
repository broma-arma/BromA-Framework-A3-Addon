/*
================================================================================

NAME:
    BRM_FMK_fnc_addEarplugs

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Add earplugs to an object.

PARAMETERS:
    0 - Object to add the earplugs to. (OBJECT)
    1 - (OPTIONAL) Amount to add, default 1. (NUMBER)
    2 - (OPTIONAL) Config name of the earplugs. (STRING)

USAGE:
    [player] call BRM_FMK_fnc_addEarplugs;
    [crate, 20] call BRM_FMK_fnc_addEarplugs;

RETURNS:
    Nothing

================================================================================
*/

params ["_object", ["_amount", 1], "_kind"];

if (isNil "_kind") then {
	_kind = ["", "ACE_EarPlugs"] select mission_ACE3_enabled;
};

if (_kind isEqualTo "") exitWith {};

if (_kind == "ACE_EarPlugs" && { _object isKindOf "Man" }) then {
	if (mission_ACE3_enabled && _object == player) then {
		[_object] call ace_hearing_fnc_putInEarplugs;
	};
} else {
	[_object, _kind, _amount] call BRM_FMK_fnc_addItem;
};
