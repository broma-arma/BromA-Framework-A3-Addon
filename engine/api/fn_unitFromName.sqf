/*
================================================================================

NAME:
    BRM_FMK_fnc_unitFromName

AUTHOR(s):
    Nife

DESCRIPTION:
    Gets a unit's object from its name.

PARAMETERS:
    0 - Name (STRING)

USAGE:
    ["Nife"] call BRM_FMK_fnc_unitFromName

RETURNS:
    Unit (OBJECT)

================================================================================
*/

params [["_name", "", [""]]];

{
	if (name _x == _name) exitWith {
		_x
	};

	objNull
} forEach allUnits;
