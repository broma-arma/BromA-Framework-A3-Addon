/*
================================================================================

NAME:
    BRM_FMK_fnc_getFaction

AUTHOR(s):
    Nife

DESCRIPTION:
    Get the faction and side of the faction.

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

private _factionSide = _defaultSide;
switch (true) do {
    case (_faction == "side_a"): { _faction = side_a_faction; _factionSide = side_a_side };
    case (_faction == "side_b"): { _faction = side_b_faction; _factionSide = side_b_side };
    case (_faction == "side_c"): { _faction = side_c_faction; _factionSide = side_c_side };
    case (_faction in _aliasBLUFOR): { _faction = [WEST, "FACTION"] call BRM_FMK_fnc_getSideInfo; _factionSide = WEST };
    case (_faction in _aliasOPFOR): { _faction = [EAST, "FACTION"] call BRM_FMK_fnc_getSideInfo; _factionSide = EAST };
    case (_faction in _aliasRESISTANCE): { _faction = [RESISTANCE, "FACTION"] call BRM_FMK_fnc_getSideInfo; _factionSide = RESISTANCE };
    default {
        switch (true) do {
            case (_faction == side_a_faction): { _factionSide = side_a_side };
            case (_faction == side_b_faction): { _factionSide = side_b_side };
            case (_faction == side_c_faction): { _factionSide = side_c_side };
        };
    };
};

[_faction, _factionSide]
