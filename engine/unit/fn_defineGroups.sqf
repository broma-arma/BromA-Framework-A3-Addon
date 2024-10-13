/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_defineGroups

AUTHOR(s):
    Nife

DESCRIPTION:
    Server-side script that assigns proper callsigns and identification
    to all units and groups.

PARAMETERS:
    None.

USAGE:
    [] call BRM_FMK_Engine_fnc_defineGroups

RETURNS:
    Nothing.

================================================================================
*/

if (!isServer) exitWith {};

{
	[_x] call BRM_FMK_Engine_fnc_setUnitGroupId;
} forEach (if (isMultiplayer) then { playableUnits } else { switchableUnits });
