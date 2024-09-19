/*
================================================================================

NAME:
    BRM_FMK_Plugin_DAC_fnc_createDACCamp

AUTHOR(s):
    Nife

DESCRIPTION:
    Create a DAC camp

PARAMETERS:
    0 - Variable name of the camp (STRING)
    1 - Zone Id (NUMBER)
    2 - Amount of camps to create (NUMBER)
    3 - Faction DAC_Config_Events number (NUMBER)
    4 - Amount of respawns (NUMBER)
    5 - Respawn types. 0: infantry and vehicles, 1: infantry, 2: vehicles. (NUMBER)
    6 - Comma seperated zone names to reinforce (STRING)
    7 - Side. 0: East, 1: West, 2: Resistance, 3: Civilian (NUMBER)
    8 - Skill. 0: Easy, 1: Normal, 2: Stealth, 3: Hard (NUMBER)
    9 - Area (ARRAY)
    10 - Position (ARRAY)

USAGE:
    ["DACZone9163", 4, 3, 1, 25, 1, "NamedZone1,NamedZone2,NamedZone3", 1, 1, [250, 250, 0, false], [600, 950]] call BRM_FMK_Plugin_DAC_fnc_createDACCamp;

RETURNS:
    Nothing.

================================================================================
*/

params ["_name", "_id", "_count", "_faction", "_respawns", "_units", "_reinforce", "_side", "_skill", "_area", "_pos"];

private _trigger = createTrigger ["EmptyDetector", _pos];
_trigger setTriggerArea _area;
_trigger setTriggerActivation ["NONE", "NOT PRESENT", false];
_trigger setTriggerStatements ["true", format (["['%1', [%2, 0, %4], [], [], [], [%3, 3, 50, %6, 100, %5, [%7]], [%8, %8, %9, %8]] call BRM_FMK_Plugin_DAC_fnc_DACZone"] + _this), ""];
missionNamespace setVariable [_name, _trigger];

mission_dac_camps pushBack [_name, _id];
