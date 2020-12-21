/*
================================================================================

NAME:
    BRM_FMK_fnc_addToUniform

AUTHOR(s):
    Nife

DESCRIPTION:
    Add an item, weapon, or magazine to a Man object's uniform.

PARAMETERS:
    0 - Man object to add the items to. (OBJECT)
    1 - Items (ARRAY)
        0 - Item config name. (STRING)
        1 - Amount. (NUMBER)

USAGE:
    [player, [["ItemGPS", 1], ["ItemCompass", 2], ["ItemWatch", 3]]] call BRM_FMK_fnc_addToUniform;

RETURNS:
    Nothing

================================================================================
*/

params ["_unit", "_items"];

{
	_x params ["_item", "_amount"];

	if !(_item isEqualTo "") then {
		for "_i" from 1 to _amount do {
			if !(_unit canAddItemToUniform _item) exitWith {};

			_unit addItemToUniform _item;
		};
	};
} forEach _items;
