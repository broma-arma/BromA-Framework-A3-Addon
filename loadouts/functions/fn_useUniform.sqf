/*
================================================================================

NAME:
    BRM_FMK_fnc_useUniform

AUTHOR(s):
    Nife

DESCRIPTION:
    Set the headgear, uniform, vest, and backpack of a Man object.

PARAMETERS:
    0 - Man object. (OBJECT)
    1 - Headgear config name. true to keep the current one, false or "" to remove. (STRING/BOOL)
    2 - Uniform config name. true to keep the current one, false or "" to remove. (STRING/BOOL)
    3 - Vest config name. true to keep the current one, false or "" to remove. (STRING/BOOL)
    4 - Backpack config name. true to keep the current one, false or "" to remove. (STRING/BOOL)

USAGE:
    [player, true, true, true, true] call BRM_FMK_fnc_useUniform;
    [player, false, false, false, false] call BRM_FMK_fnc_useUniform;
    [player, "H_MilCap_gry", "U_B_CTRG_1", "V_BandollierB_rgr", "B_AssaultPack_rgr"] call BRM_FMK_fnc_useUniform;

RETURNS:
    Nothing

================================================================================
*/

params ["_unit", "_headgear", "_uniform", "_vest", "_backpack"];

{
	_x params ["_item", "_remove", "_add"];

	switch (_item) do {
		case "keep"; // Backward compatibility
		case true: {};

		case "empty"; // Backward compatibility
		case false;
		case "": _remove;

		default { call _remove; call _add; };
	};
} forEach [
	[_headgear, { removeHeadgear _unit; }, { _unit addHeadgear _item; }],
	[_uniform,  { removeUniform _unit; },  { _unit forceAddUniform _item; }],
	[_vest,     { removeVest _unit; },     { _unit addVest _item; }],
	[_backpack, { removeBackpack _unit; }, { [_unit, _item] call BRM_FMK_fnc_addEmptyBackpack; }]
];
