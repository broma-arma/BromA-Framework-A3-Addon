#include "script_component.hpp"
/*
================================================================================

NAME:
    BRM_FMK_fnc_addWeaponAttachments

AUTHOR(s):
    Nife

DESCRIPTION:
    Add weapon attachments to a Man object's weapon.

PARAMETERS:
    0 - Man object. (OBJECT)
    1 - Weapon type: "primary", "secondary", or "handgun". (STRING)
    2 - Weapon attachments. (ARRAY)
        0 - Optic attachment config name(s). If an array, a random one will be chosen. (STRING/ARRAY of STRING)
        1 - Muzzle attachment config name(s). If an array, a random one will be chosen. (STRING/ARRAY of STRING)
        2 - Rail attachment config name(s). If an array, a random one will be chosen. (STRING/ARRAY of STRING)
        3 - Bipod attachment config name(s). If an array, a random one will be chosen. (STRING/ARRAY of STRING)
    4 - (OPTIONAL) Weapon attachment indexes to add. Default: [0, 1, 2, 3] (ARRAY)

USAGE:
    [_agent, "primary", [["optic_aco", "optic_aco_grn"], "acc_pointer_ir", ["muzzle_snds_h", "muzzle_snds_h_khk_f"], "bipod_01_f_blk"]] call BRM_FMK_fnc_addWeaponAttachments;
    [_agent, "secondary", ["", ["acc_pointer_ir", "acc_flashlight"], "", ""], [1]] call BRM_FMK_fnc_addWeaponAttachments;
    [_agent, "handgun", [["optic_mrd", "optic_mrd_black"], ["", "acc_flashlight_pistol"], ["", "muzzle_snds_acp"], ""], [0, 1, 2]] call BRM_FMK_fnc_addWeaponAttachments;

RETURNS:
    Nothing

================================================================================
*/

params ["_unit", "_type", "_attachments", ["_selected", [0, 1, 2, 3]]];

if !(_selected isEqualType []) then {
	_selected = [_selected];
};

{
	private _attachment = _attachments select _x;
	if (_attachment isEqualType []) then {
		_attachment = selectRandom _attachment;
	};
	if (_attachment != "") then {
		[_unit, _type, _attachment] call FUNCMAIN(attachToWeapon);
	};
} forEach _selected;
