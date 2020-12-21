/*
================================================================================

NAME:
    BRM_FMK_fnc_addEmptyBackpack

AUTHOR(s):
    Nife

DESCRIPTION:
    Add an empty backpack to an object.

PARAMETERS:
    0 - Object to add the backpack to. (OBJECT)
    1 - Config name of the backpack. (STRING)
    2 - (OPTIONAL) Not a Man object: Amount to add, default 1. (NUMBER)

USAGE:
    [player, "B_AssaultPack_blk"] call BRM_FMK_fnc_addItem;
    [crate, "B_AssaultPack_rgr"] call BRM_FMK_fnc_addItem;
    [crate, "B_AssaultPack_rgr", 5] call BRM_FMK_fnc_addItem;

RETURNS:
    Nothing

================================================================================
*/

params ["_unit", "_backpack", ["_amount", 1]];

if (_backpack isEqualTo "" || _amount < 1) exitWith {};

if (_unit isKindOf "Man") then {
	_unit addBackpack _backpack;

	clearAllItemsFromBackpack _unit;
} else {
	private _backpacks = everyBackpack _unit;
	_unit addBackpackCargoGlobal [_backpack, _amount];
	{
		clearBackpackCargoGlobal _x;
		clearItemCargoGlobal _x;
		clearMagazineCargoGlobal _x;
		clearWeaponCargoGlobal _x;
	} forEach (everyBackpack _unit - _backpacks);
};
