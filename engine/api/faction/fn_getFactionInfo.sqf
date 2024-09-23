/*
================================================================================

NAME:
    BRM_FMK_fnc_getFactionInfo

AUTHOR(s):
    Nife

DESCRIPTION:
    Get the faction and side of the faction.

PARAMETERS:
    0 - The side or faction name. (STRING)
    1 - (OPTIONAL) The default faction side. (SIDE)

USAGE:
	["side_a"] call BRM_FMK_fnc_getFactionInfo;
	["west"] call BRM_FMK_fnc_getFactionInfo;
	["NATO"] call BRM_FMK_fnc_getFactionInfo;

RETURNS:
    The faction name and side. (ARRAY)

================================================================================
*/

params ["_faction", ["_defaultSide", WEST]];

switch (toLower _faction) do {
	case "side_a";
	case (toLower side_a_faction): { [side_a_faction, side_a_side] };
	case "side_b";
	case (toLower side_b_faction): { [side_b_faction, side_b_side] };
	case "side_c";
	case (toLower side_c_faction): { [side_c_faction, side_c_side] };
	case "west";
	case "blufor": { [[BLUFOR, "FACTION"] call BRM_FMK_fnc_getSideInfo, BLUFOR] };
	case "east";
	case "redfor";
	case "opfor": { [[OPFOR, "FACTION"] call BRM_FMK_fnc_getSideInfo, OPFOR] };
	case "resistance";
	case "guer";
	case "guerilla";
	case "indfor";
	case "independent": { [[INDEPENDENT, "FACTION"] call BRM_FMK_fnc_getSideInfo, INDEPENDENT] };
	case "civ";
	case "civies";
	case "civilians";
	case "civilian": { [[CIVILIAN, "FACTION"] call BRM_FMK_fnc_getSideInfo, CIVILIAN] };
	default { [_faction, _defaultSide] };
};
