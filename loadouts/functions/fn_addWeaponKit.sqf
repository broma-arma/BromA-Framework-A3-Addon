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
    2 - Amount of magazines to add. (NUMBER)
    3 - (OPTIONAL) Weapon attachments. Default []. (ARRAY)

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

params ["_unit", "_kind", "_amount", ["_attachments", [], [[]]]];

if (_kind isEqualTo "") exitWith {};

_kind params [["_weapon", "", [""]], ["_magazine", "", [""]]];

if (_weapon isEqualTo "") exitWith {};

[_unit, _magazine, _amount] call BRM_FMK_fnc_addAmmo;
[_unit, _weapon, 1] call BRM_FMK_fnc_addWeapon;

{
	if (_x isEqualType []) then { _x = if (_x isEqualTo []) then { "" } else { selectRandom _x }; };

	if (_x isNotEqualTo "") then {
		_unit addWeaponItem [_weapon, _x, true];
	};
} forEach _attachments;
