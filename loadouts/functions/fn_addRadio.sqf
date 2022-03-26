/*
================================================================================

NAME:
    BRM_FMK_fnc_addRadio

AUTHOR(s):
    Nife

DESCRIPTION:
    Add a radio to a Man object.

PARAMETERS:
    0 - Man object to add the radio to. (OBJECT)
    1 - "SR", "LR", or "BP". (STRING)
    2 - Config name of the backpack to use for ACRE2 backpack radios. (STRING)

USAGE:
    [player, "SR", "B_AssaultPack_blk"] call BRM_FMK_fnc_addRadio;
    [player, "LR", "B_AssaultPack_blk"] call BRM_FMK_fnc_addRadio;
    [player, "BP", "B_AssaultPack_blk"] call BRM_FMK_fnc_addRadio;

RETURNS:
    Nothing

================================================================================
*/

params ["_unit", "_kind", "_backpack"];

if (_kind isEqualTo "") exitWith {};

private _kindIndex = ["SR", "LR", "BP"] find _kind;
if (_kindIndex == -1) exitWith {
	["Invalid kind: %1 (%2)", _kind, _this] call BIS_fnc_error;
};

private _sideIndex = [WEST, EAST, RESISTANCE, CIVILIAN] find side _unit;
if (_sideIndex == -1) exitWith {
	["Invalid unit side: %1 (%2)", side _unit, _this] call BIS_fnc_error;
};

// CIVILIAN
if (_sideIndex == 3) exitWith {};

switch (true) do {
	case (mission_TFAR_enabled): {
		private _radios = ["Rifleman", "Personal", "Backpack"] apply {
			missionNamespace getVariable [format ["TFAR_DefaultRadio_%1_%2", _x, ["West", "East", "Independent"] select _sideIndex], ""];
		};

		private _radio = _radios select _kindIndex;
		if (_radio != "") then {
			if (_kindIndex == 2) then { // BP
				if (backpack _unit != _radio) then {
					removeBackpack _unit;
					[_unit, _radio] call BRM_FMK_fnc_addEmptyBackpack;
				};
			} else {
				private _otherRadio = _radios select ([1, 0] select _kindIndex);
				if (assignedItems _unit findIf { _x find _radio == 0 || _x find _otherRadio == 0 } == -1) then {
					_unit linkItem _radio;
				};
			};
		};
	};

	case (mission_ACRE2_enabled): {
		private _radios = ["ACRE_PRC343", "ACRE_PRC148", "ACRE_PRC117F"];

		private _radio = _radios select _kindIndex;
		if (_radio != "") then {
			if (_kindIndex == 2) then { // BP
				if (backpackItems _unit findIf { _x find _radio == 0 } == -1) then {
					if !(_unit canAddItemToBackpack _radio) then {
						[_unit, _backpack] call BRM_FMK_fnc_addEmptyBackpack;
					};
					_unit addItemToBackpack _radio;
				};
			} else {
				private _otherRadio = _radios select ([1, 0] select _kindIndex);
				if (items _unit findIf { _x find _radio == 0 || _x find _otherRadio == 0 } == -1) then {
					_unit addItem _radio;
				};
			};
		};
	};
};
