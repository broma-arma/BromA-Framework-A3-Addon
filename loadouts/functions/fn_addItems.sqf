/*
================================================================================

NAME:
    BRM_FMK_fnc_addItems

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Add items, weapons, magazines or backpacks to an object.

PARAMETERS:
    0 - Object to add the item to. (OBJECT)
    1+- Config name of the item to add, if string. (STRING/ARRAY)
        0 - Config name of the item to add. (STRING)
        1 - (OPTIONAL) Amount to add, default 1. (NUMBER)
        2 - (OPTIONAL) Man object only: priority of the uniform, vest, backpack, default "uvb". (STRING)

USAGE:
    [player, ["Chemlight_blue", 2], "Chemlight_red", ["ToolKit", 1, "bvu"], ["SmokeShell", 2, "vub"], ["MineDetector", 1, "vbu"]] call BRM_FMK_fnc_addItems;

RETURNS:
    Nothing.

================================================================================
*/

params ["_object"];

{
	if (_forEachIndex > 0) then {
		if (_x isEqualType []) then {
			([_object] + _x) call BRM_FMK_fnc_addItem;
		} else {
			[_object, _x] call BRM_FMK_fnc_addItem;
		};
	};
} forEach _this;
