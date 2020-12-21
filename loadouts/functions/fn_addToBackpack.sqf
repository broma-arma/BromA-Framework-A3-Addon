/*
================================================================================

NAME:
    BRM_FMK_fnc_addToBackpack

AUTHOR(s):
    Nife

DESCRIPTION:
    Add an item, weapon, or magazine to a Man object's backpack.

PARAMETERS:
    0 - Man object to add the items to. (OBJECT)
    1 - Items (ARRAY)
        0 - Item config name. (STRING)
        1 - Amount. (NUMBER)

USAGE:
    [player, [["ItemGPS", 1], ["ItemCompass", 2], ["ItemWatch", 3]]] call BRM_FMK_fnc_addToBackpack;

RETURNS:
    Nothing

================================================================================
*/

params ["_unit", "_items"];

{
	_x params ["_item", "_amount"];

	if !(_item isEqualTo "") then {
		for "_i" from 1 to _amount do {
			if !(_unit canAddItemToBackpack _item) exitWith {};

			_unit addItemToBackpack _item;
		};
	};
} forEach _items;
