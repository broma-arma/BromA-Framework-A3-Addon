/*
================================================================================

DEPRECATED:
    Remove usage.

NAME:
    BRM_FMK_DAC_fnc_initVehicleCrew

AUTHOR(s):
    Nife

DESCRIPTION:
    Initialize the loadout of a vehicle's crew.

PARAMETERS:
    0 - Vehicle. (OBJECT)
    0 - Faction. (STRING)
    0 - Side. (SIDE)

USAGE:
    [vehicle, "RACS", WEST] call BRM_FMK_DAC_fnc_initVehicleCrew;

RETURNS:
    Nothing.

================================================================================
*/

params [
	["_vehicle", objNull, [objNull]],
	["_faction", "side_b", [""]],
	["_side", WEST, [WEST]]
];

if !(_vehicle getVariable ["BRM_FMK_DAC_Vehicle_Loadout", false]) then {
	_vehicle setVariable ["BRM_FMK_DAC_Vehicle_Loadout", true];

	[{
		params ["_args", "_handle"];

		_args params ["_vehicle", "_faction", "_side"];

		if (alive _vehicle) then {
			{
				if (side _x == _side) then {
					[_x, _faction] call BRM_fnc_initAI;
				};
			} forEach crew _vehicle;
		} else {
			[_handle] call CBA_fnc_removePerFrameHandler;
		};
	}, 15, [_vehicle, _faction, _side]] call CBA_fnc_addPerFrameHandler;
};
