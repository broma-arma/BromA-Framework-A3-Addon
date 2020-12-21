/*
================================================================================

NAME:
    BRM_FMK_fnc_addRadioToCargo

AUTHOR(s):
    Nife

DESCRIPTION:
    Add a radio to a cargo object.

PARAMETERS:
    0 - Cargo object to add the radio to. (OBJECT)
    1 - "SR", "LR", or "BP". (STRING)
    2 - WEST, EAST, or RESISTANCE. (SIDE)
    2 - (OPTIONAL) Amount to add. Defaults to 1. (NUMBER)

USAGE:
    [crate, "SR", WEST, 20] call BRM_FMK_fnc_addRadioToCargo;
    [crate, "LR", WEST, 10] call BRM_FMK_fnc_addRadioToCargo;
    [crate, "BP", WEST, 5] call BRM_FMK_fnc_addRadioToCargo;

RETURNS:
    Nothing

================================================================================
*/

params ["_unit", "_kind", "_side", ["_amount", 1]];

if (_kind isEqualTo "") exitWith {};

private _kindIndex = ["SR", "LR", "BP"] find _kind;
if (_kindIndex == -1) exitWith {
	["Invalid kind: %1 (%2)", _kind, _this] call BIS_fnc_error;
};

private _sideIndex = [WEST, EAST, RESISTANCE, CIVILIAN] find _side;
if (_sideIndex == -1) exitWith {
	["Invalid side: %1 (%2)", _side, _this] call BIS_fnc_error;
};

if (_sideIndex == 3) exitWith {};

private _radio = switch (true) do {
	case (mission_TFAR_enabled): {
		missionNamespace getVariable [format ["TFAR_DefaultRadio_%1_%2",
			["Rifleman", "Personal", "Backpack"] select _kindIndex,
			["West", "East", "Independent"] select _sideIndex
		], ""]
	};

	case (mission_ACRE2_enabled): {
		["ACRE_PRC343", "ACRE_PRC148", "ACRE_PRC117F"] select _kindIndex;
	};

	default { "" };
};

if (_radio != "") then {
	if (!mission_ACRE2_enabled && _kindIndex == 2) then { // BP
		_unit addBackpackCargoGlobal [_radio, _amount];
	} else {
		_unit addItemCargoGlobal [_radio, _amount];
	};
};
