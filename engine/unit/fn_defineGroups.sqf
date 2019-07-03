/*
================================================================================

NAME:
    BRM_fnc_defineGroups

AUTHOR(s):
    Nife

DESCRIPTION:
    Server-side script that assigns proper callsigns and identification
    to all units and groups.

PARAMETERS:
    None.

USAGE:
    [] call BRM_fnc_defineGroups

RETURNS:
    Nothing.

================================================================================
*/

if (!isServer) exitWith {};

waitUntil { !isNil "mission_settings_loaded" && {mission_settings_loaded} };

mission_groups_init = false; publicVariable "mission_groups_init";

private _unitsToCheck = if (isMultiplayer) then { playableUnits } else { allUnits };

{
	private _unitInit = _x getVariable "unitInit";
	if !(isNil "_unitInit") then {
		private _unitName = str _x splitString "_";
		if (count _unitName == 4) then {
			_unitInit params ["_color", "_loadout", "_role", "_groupName"];

			missionNamespace setVariable [(_unitName select [0, 3]) joinString "_", group _x, true];

			[_x, _groupName, _role] call BRM_FMK_fnc_setAlias;
		};
	};
} forEach _unitsToCheck;

mission_groups_init = true; publicVariable "mission_groups_init";
