/*
================================================================================

NAME:
    BRM_FMK_fnc_addWeaponKit

AUTHOR(s):
    Nife

DESCRIPTION:
    Add a weapon and magazines to an object.

PARAMETERS:
    0 - Object to add the items to. (OBJECT)
    1 - Array (ARRAY)
        0 - Config name of the weapon. (STRING)
        1 - Config name of the magazine. (STRING)
    2 - Amount of magazines to add. (NUMBER/ARRAY)
        0 - Amount of primary magazines to add. (NUMBER)
        1 - Amount of secondary magazines to add. (NUMBER)
    3 - (OPTIONAL) Muzzle attachment, random if array. Default "". (STRING/ARRAY)
    4 - (OPTIONAL) Rail attachment, random if array. Default "". (STRING/ARRAY)
    5 - (OPTIONAL) Optic attachment, random if array. Default "". (STRING/ARRAY)
    6 - (OPTIONAL) Bipod attachment, random if array. Default "". (STRING/ARRAY)
    7 - (OPTIONAL) Cargo object only: Amount of weapons to add. Default 1. (NUMBER)

USAGE:
    [player, ["arifle_MX_F", "30Rnd_65x39_caseless_mag"], 7] call BRM_FMK_fnc_addWeaponKit;
    [player, ["arifle_MX_SW_F", "100Rnd_65x39_caseless_mag"], 3] call BRM_FMK_fnc_addWeaponKit;
    [player, ["launch_NLAW_F", "NLAW_F"], 1] call BRM_FMK_fnc_addWeaponKit;
    [crate, ["arifle_MX_F", "30Rnd_65x39_caseless_mag"], 50] call BRM_FMK_fnc_addWeaponKit;
    [crate, ["arifle_MX_SW_F", "100Rnd_65x39_caseless_mag"], 20] call BRM_FMK_fnc_addWeaponKit;
    [crate, ["launch_NLAW_F", "NLAW_F"], 10] call BRM_FMK_fnc_addWeaponKit;

RETURNS:
    Nothing

================================================================================
*/

params ["_unit", "_kind", "_amount", ["_muzzle", "", ["", []]], ["_rail", "", ["", []]], ["_optic", "", ["", []]], ["_bipod", "", ["", []]], ["_weaponAmount", 1, [0]]];

_kind params [["_weapon", "", [""]], ["_primaryMagazine", "", [""]], ["_secondaryMagazine", "", [""]]];

if (_weapon isEqualTo "") exitWith {};

_amount params ["_primaryAmount", ["_secondaryAmount", 0, [0]]];

if (_unit isKindOf "Man") then {
	_unit addWeapon _weapon;

	{
		if (_x isEqualType []) then { _x = if (_x isEqualTo []) then { "" } else { selectRandom _x }; };

		if (_x isNotEqualTo "") then {
			_unit addWeaponItem [_weapon, _x, true];
		};
	} forEach [_muzzle, _rail, _optic, _bipod];

	if (_primaryMagazine != "") then {
		_unit addWeaponItem [_weapon, _primaryMagazine, true];
		[_unit, _primaryMagazine, _primaryAmount - 1, ["vbu", "bvu"] select (getNumber (configFile >> "CfgMagazines" >> _secondaryMagazine >> "mass") > 10)] call BRM_FMK_fnc_addItem;
	};
	if (_secondaryMagazine != "") then {
		_unit addWeaponItem [_weapon, _secondaryMagazine, true];
		[_unit, _secondaryMagazine, _secondaryAmount - 1, ["vbu", "bvu"] select (getNumber (configFile >> "CfgMagazines" >> _secondaryMagazine >> "mass") > 10)] call BRM_FMK_fnc_addItem;
	};
} else {
	_unit addWeaponWithAttachmentsCargoGlobal [[_weapon, _muzzle, _rail, _optic, [_primaryMagazine, -1], [_secondaryMagazine, -1], _bipod], _weaponAmount];
	if (_primaryMagazine != "") then {
		_unit addItemCargoGlobal [_primaryMagazine, _primaryAmount - _weaponAmount];
	};
	if (_secondaryMagazine != "") then {
		_unit addItemCargoGlobal [_secondaryMagazine, _secondaryAmount - _weaponAmount];
	};
};
