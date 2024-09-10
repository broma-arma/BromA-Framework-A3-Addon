/*
================================================================================

DEPRECATED:
    Replace usage with: [_object, _item1, _item2, ...] call BRM_FMK_fnc_addItems;

NAME:
    BRM_FMK_fnc_addToCargo

AUTHOR(s):
    Nife

DESCRIPTION:
    Add items, weapons, magazines, or backpacks to a cargo object.

PARAMETERS:
    0 - Cargo object to add the items to. (OBJECT)
    1 - Items type: "weapon", "magazine", "item" or "backpack" (STRING)
    2+ - Item (ARRAY)
        0 - Item config name. (STRING)
        1 - Amount. (NUMBER)

USAGE:
    [crate, "item", ["ItemGPS", 1], ["ItemCompass", 2], ["ItemWatch", 3]] call BRM_FMK_fnc_addToCargo;

RETURNS:
    Nothing

================================================================================
*/

if (count _this == 1 && { _this select 0 isEqualType [] }) then {
	// Backward compatibility
	_this = _this select 0;
};

params ["_unit", "_type"];

[_unit] + (_this select [2]) call BRM_FMK_fnc_addItems;
