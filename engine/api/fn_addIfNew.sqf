/*
================================================================================

DEPRECATED:
    Use pushBackUnique.

NAME:
    BRM_FMK_fnc_addIfNew
    
AUTHOR(s):
    Nife

DESCRIPTION:
    Adds an item to an array if it doesn't currently exists in it - otherwise
    replaces the current index.
    
PARAMETERS:
    0 - Item to add (ANY)
    1 - Array (ARRAY)

USAGE:
    ["Nife", myArrayOfPlayers] call BRM_FMK_fnc_addIfNew
    
RETURNS:
    Index of the item.

================================================================================
*/

params ["_item", ["_array", [], [[]]]];

if (isNil "_item") exitWith { -1 };

private _index = count _array;

{ if (_x isEqualTo _item) exitWith { _index = _forEachIndex } } forEach _array;

_array set [_index, _item];

_index
