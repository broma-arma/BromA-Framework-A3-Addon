#include "script_component.hpp"
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

params ["_unit", "_kind", "_amount"];

if (_kind isEqualTo "") exitWith {};

[_unit, _kind, _amount] call FUNCMAIN(addAmmo);
[_unit, _kind, 1] call FUNCMAIN(addWeapon);
