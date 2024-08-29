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

private _headgearSubItems = getArray (configfile >> "CfgWeapons" >> headgear _unit >> "subItems") apply { _x call BIS_fnc_itemType }; // Skip item if helmet has integrated item.
{
	if (_x isNotEqualTo "" && { !(_x call BIS_fnc_itemType in _headgearSubItems) }) then {
		_unit linkItem _x;
	};
} forEach _items;
