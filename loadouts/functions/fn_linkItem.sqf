#include "script_component.hpp"
/*
================================================================================

NAME:
    BRM_FMK_fnc_linkItem

AUTHOR(s):
    Nife

DESCRIPTION:
    Link an item to a Man object.

PARAMETERS:
    0 - Man object. (OBJECT)
    1 - Items to link. (ARRAY of STRING)

USAGE:
    [player, ["ItemWatch", "ItemCompass", "ItemGPS", "ItemRadio", "ItemMap", "NVGoggles"]] call BRM_FMK_fnc_linkItem;
    [player, ["B_UavTerminal", "NVGogglesB_blk_F"]] call BRM_FMK_fnc_linkItem;
    [player, ["ItemWatch", "ItemCompass", "B_UavTerminal", "ItemRadio", "ItemMap", "NVGogglesB_blk_F"]] call BRM_FMK_fnc_linkItem;

RETURNS:
    Nothing

================================================================================
*/

params ["_unit", "_items"];

{
	if (_x isNotEqualTo "") then {
		_unit linkItem _x;
	};
} forEach _items;
