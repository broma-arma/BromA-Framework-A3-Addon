#include "component.hpp"
/*
================================================================================

NAME:
    BRM_FMK_fnc_stripItems

AUTHOR(s):
    Nife

DESCRIPTION:
    Remove all items from a unit object.

PARAMETERS:
    0 - Unit (OBJECT)

USAGE:
    [player] call BRM_FMK_fnc_stripItems

RETURNS:
    Nothing.

================================================================================
*/

params [["_unit", objNull, [objNull]]];

_unit setUnitLoadout (configFile >> "EmptyLoadout");
