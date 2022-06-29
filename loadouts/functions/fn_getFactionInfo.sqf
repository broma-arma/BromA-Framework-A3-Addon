/*
================================================================================

NAME:
    BRM_FMK_fnc_getFaction

AUTHOR(s):
    Nife

DESCRIPTION:
    Get the faction name and side of the faction.

PARAMETERS:
    0 - The side or faction name. (STRING)
    1 - (OPTIONAL) The default faction side. (SIDE)

USAGE:
	["side_a"] call BRM_FMK_fnc_getFaction;
	["west"] call BRM_FMK_fnc_getFaction;
	["NATO"] call BRM_FMK_fnc_getFaction;

RETURNS:
    The faction name and side. (ARRAY)

================================================================================
*/

params ["_faction", ["_defaultSide", WEST]];

private _aliasBLUFOR = ["blufor", "west"];
private _aliasOPFOR = ["opfor", "redfor", "east"];
private _aliasRESISTANCE = ["independent", "resistance", "indfor", "guerilla", "guer"];
//private _aliasCIVILIAN = ["civilian", "civilians", "civies", "civ"];

switch (true) do {
	case (_faction == "side_a"): { [side_a_faction, side_a_side] };
	case (_faction == "side_b"): { [side_b_faction, side_b_side] };
	case (_faction == "side_c"): { [side_c_faction, side_c_side] };
	case (_faction in _aliasBLUFOR): { [[WEST, "FACTION"] call BRM_FMK_fnc_getSideInfo, WEST] };
	case (_faction in _aliasOPFOR): { [[EAST, "FACTION"] call BRM_FMK_fnc_getSideInfo, EAST] };
	case (_faction in _aliasRESISTANCE): { [[RESISTANCE, "FACTION"] call BRM_FMK_fnc_getSideInfo, RESISTANCE] };
	case (_faction == side_a_faction): { [_faction, side_a_side] };
	case (_faction == side_b_faction): { [_faction, side_b_side] };
	case (_faction == side_c_faction): { [_faction, side_c_side] };
	default { [_faction, _defaultSide] };
};
