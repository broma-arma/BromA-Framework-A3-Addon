#include "script_component.hpp"
/*
================================================================================

NAME:
    BRM_FMK_fnc_getSideUAV

AUTHOR(s):
    Nife

DESCRIPTION:
    Get the UAV and terminal config names for a Man object's side.

PARAMETERS:
    0 - Man object. (OBJECT)
    1 - UAV type: "ar2", "al6", "al6med". (STRING)

USAGE:
	[player, "ar2"] call BRM_FMK_fnc_getSideUAV;
	[player, "al6"] call BRM_FMK_fnc_getSideUAV;
	[player, "al6med"] call BRM_FMK_fnc_getSideUAV;

RETURNS:
    UAV and terminal config name. If parameter 1 isn't supported, UAV config name will be an empty string. (ARRAY)
        0 - UAV config name. (STRING)
        1 - Terminal config name. (STRING)

================================================================================
*/

params ["_unit", "_type"];

private _sideChar = switch (side _unit) do {
	case WEST: { "B" };
	case EAST: { "O" };
	case RESISTANCE: { "I" };
	default { "B" };
};

switch (toLower _type) do {
	case "vanilla"; // Backward compatibility
	case "ar2": { [_sideChar + "_UAV_01_backpack_F"/*UAV Bag (AR-2)*/, _sideChar + "_UavTerminal"] };
	case "al6": { [_sideChar + "_UAV_06_backpack_F"/*UAV Bag (AL-6)*/, _sideChar + "_UavTerminal"] };
	case "al6med": { [_sideChar + "_UAV_06_medical_backpack_F"/*UAV Bag (AL-6, Medical)*/, _sideChar + "_UavTerminal"] };
	default { ["", ""] };
};
