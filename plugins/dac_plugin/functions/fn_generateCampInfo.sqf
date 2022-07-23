/*
================================================================================

NAME:
    BRM_FMK_DAC_fnc_generateCampInfo

AUTHOR(s):
    Nife

DESCRIPTION:
    Returns an array containing DAC camp info

PARAMETERS:
    0 - Side to get the DAC camp info of. (SIDE)

USAGE:
    [WEST] call BRM_FMK_DAC_fnc_generateCampInfo;

RETURNS:
    An array containing DAC camp info for the side. (ARRAY)

================================================================================
*/

params [
	["_side", WEST, [WEST]]
];

#include "\broma_framework\loadouts\includes\vehicles-index.sqf"
#include "\broma_framework\loadouts\includes\faction-info-index.sqf"

private _faction = [_side, "FACTION"] call BRM_FMK_fnc_getSideInfo;

private _campInfo = [_faction, "DACCAMPS"] call BRM_fnc_getLoadoutProperty;
private _staticVehicles = [_faction, "VEHICLES"] call BRM_fnc_getLoadoutProperty select STATIC_DEFENSE;

_campInfo params [
	"_basic",
	"_objects",
	"_walls",
	"_ammo",
	["_static", [[-7, 25, 0], [25, 25, 0], [25, -20, 180], [-7, -20, 180]]]
];

private _staticGunner = switch (_side) do {
	case WEST:      { "B_Soldier_F" };
	case EAST:       { "O_Soldier_F" };
	case INDEPENDENT: { "I_Soldier_F" };
	default           { "B_Soldier_F" };
};
_static = if (count _staticVehicles > 0) then { _static apply { [selectRandom _staticVehicles, _x select 0, _x select 1, _x select 2, _staticGunner] } } else { [] };

// An additional guard is needed to initAI of camp units in mission framework version <= 075
private _additionalGuards = [_staticGunner];

[_basic, _objects, _static, _additionalGuards, _walls, _ammo]
