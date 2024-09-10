/*
================================================================================

NAME:
    BRM_FMK_fnc_getRadio

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Get side specific radio classname.

PARAMETERS:
    0 - Object or Side to get the radio for. (OBJECT/SIDE)
    1 - "SR", "LR", or "BP". (STRING)

USAGE:
    [BLUFOR, "SR"] call BRM_FMK_fnc_getRadio;
    [OPFOR, "LR"] call BRM_FMK_fnc_getRadio;
    [INDEPENDENT, "BP"] call BRM_FMK_fnc_getRadio;

RETURNS:
    Classname of the radio. (STRING)

================================================================================
*/

params ["_unit", "_kind"];

if (_kind isEqualTo "") exitWith { "" };

private _kindIndex = ["SR", "LR", "BP"] find _kind;
if (_kindIndex == -1) exitWith { ["Invalid kind: %1 (%2)", _kind, _this] call BIS_fnc_error; "" };

if (_unit isEqualType objNull) then { _unit = side _unit; };
private _sideIndex = [BLUFOR, OPFOR, INDEPENDENT, CIVILIAN] find _unit;
if (_sideIndex == -1) exitWith { ["Invalid side: %1 (%2)", _unit, _this] call BIS_fnc_error; "" };
if (_sideIndex == 3) exitWith { "" };

if (mission_TFAR_enabled) exitWith {
	missionNamespace getVariable [format ["TFAR_DefaultRadio_%1_%2",
		["Rifleman", "Personal", "Backpack"] select _kindIndex,
		["West", "East", "Independent"] select _sideIndex
	], ""]
};

if (mission_ACRE2_enabled) exitWith {
	["ACRE_PRC343", "ACRE_PRC148", "ACRE_PRC117F"] select _kindIndex
};

["ItemRadio", "ItemRadio", ""] select _kindIndex
