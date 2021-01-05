#include "component.hpp"
/*
================================================================================

DEPRECATED:
    Use setUnitLoadout.

NAME:
    BRM_FMK_fnc_setGear

AUTHOR(s):
    bux578

DESCRIPTION:
    Restores previously saved gear

PARAMETERS:
    0 - A player object. (OBJECT)
    0 - An array containing all gear. (ARRAY)

USAGE:
    [player, [player] call BRM_FMK_fnc_getGear] call BRM_FMK_fnc_setGear;

RETURNS:
    Nothing.

================================================================================
*/

params [["_unit", objNull, [objNull]], ["_allGear", [], [[]], 19]];

// remove all starting gear of a player
removeAllWeapons _unit;
removeGoggles _unit;
removeHeadgear _unit;
removeVest _unit;
removeUniform _unit;
removeAllAssignedItems _unit;
clearAllItemsFromBackpack _unit;
removeBackpack _unit;

_allGear params [
	["_headgear", "", [""]],
	["_goggles", "", [""]],
	["_uniform", "", [""]], ["_uniformItems", [], [[]]],
	["_vest", "", [""]], ["_vestItems", [], [[]]],
	["_backpack", "", [""]], ["_backpackItems", [], [[]]],
	["_primaryWeapon", "", [""]], ["_primaryWeaponItems", [], [[]]], ["_primaryWeaponMagazine", [], [[]]],
	["_secondaryWeapon", "", [""]], ["_secondaryWeaponItems", [], [[]]], ["_secondaryWeaponMagazine", [], [[]]],
	["_handgunWeapon", "", [""]], ["_handgunWeaponItems", [], [[]]], ["_handgunWeaponMagazine", [], [[]]],
	["_assignedItems", [], [[]]],
	["_binocular", "", [""]]
];

// start restoring the items
if (_headgear != "") then {
	_unit addHeadgear _headgear;
};
if (_uniform != "") then {
	_unit forceAddUniform _uniform;
};
if (_vest != "") then {
	_unit addVest _vest;
};
if (_goggles != "") then {
	_unit addGoggles _goggles;
};

{
	_unit addItemToUniform _x;
} forEach _uniformItems;

{
	_unit addItemToVest _x;
} forEach _vestItems;

if(_backpack != "") then {
	_unit addBackpack _backpack;

	private _backpa = unitBackpack _unit;
	clearMagazineCargoGlobal _backpa;
	clearWeaponCargoGlobal _backpa;
	clearItemCargoGlobal _backpa;
	{
		_unit addItemToBackpack _x;
	} forEach _backpackItems;
};

_assignedItems = _assignedItems - [_binocular];

// items
{
	_unit linkItem _x;
} forEach _assignedItems;

_unit addWeapon _binocular;

if ("Laserdesignator" in assignedItems _unit) then {
	_unit selectWeapon "Laserdesignator";
	if (currentMagazine _unit == "") then {
		_unit addMagazine "Laserbatteries";
	};
};

// secondaryWeapon
if (_secondaryWeapon != "") then {
	{
		_unit addMagazine _x;
	} forEach _secondaryWeaponMagazine;

	_unit addWeapon _secondaryWeapon;

	{
		if (_x != "") then {
			_unit addSecondaryWeaponItem _x;
		};
	} forEach _secondaryWeaponItems;
};

// handgun
if (_handgunWeapon != "") then {
	{
		_unit addMagazine _x;
	} forEach _handgunWeaponMagazine;

	_unit addWeapon _handgunWeapon;

	{
		if (_x != "") then {
			_unit addHandgunItem _x;
		};
	} forEach _handgunWeaponItems;
};

// primaryWeapon
if (_primaryWeapon != "") then {
	{
		_unit addMagazine _x;
	} forEach _primaryWeaponMagazine;

	_unit addWeapon _primaryWeapon;

	{
		if (_x != "") then {
			_unit addPrimaryWeaponItem _x;
		};
	} forEach _primaryWeaponItems;
};
