/*
================================================================================

NAME:
    BRM_FMK_fnc_getUnitsArray

AUTHOR(s):
    Nife

DESCRIPTION:
    Returns an array containing unit class names for the side

PARAMETERS:
    0 - Side to get the unit class names of. (SIDE)

USAGE:
    [WEST] call BRM_FMK_fnc_getUnitsArray;

RETURNS:
    An array containing unit class names for the side. (ARRAY)

================================================================================
*/

params [["_side", WEST, [WEST]]];

_side = switch (_side) do {
	case WEST:       { "B" };
	case EAST:       { "O" };
	case RESISTANCE: { "I" };
	default          { "B" };
};

[
	"_crew_F", "_Helipilot_F",
	"_Soldier_SL_F", "_soldier_AR_F", "_soldier_AR_F", "_soldier_exp_F", "_soldier_GL_F", "_soldier_GL_F", "_soldier_M_F",
	"_medic_F", "_soldier_AA_F", "_soldier_repair_F", "_Soldier_F", "_Soldier_F", "_soldier_LAT_F", "_soldier_LAT_F",
	"_soldier_lite_F", "_soldier_TL_F", "_soldier_TL_F"
] apply { _side + _x }
