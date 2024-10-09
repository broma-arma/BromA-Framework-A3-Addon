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

private _side = _unit call BIS_fnc_objectSide;
private _radio = [_side, _kind] call BRM_FMK_fnc_getRadio;
if (_radio == "") exitWith {};

if (mission_TFAR_enabled) exitWith {
	if (_kind == "BP") then {
		if (backpack _unit != _radio) then {
			removeBackpack _unit;
			[_unit, _radio] call BRM_FMK_fnc_addEmptyBackpack;
		};
	} else {
		private _currentRadio = _unit getSlotItemName 611;
		private _otherRadio = [_side, ["SR", "LR"] select parseNumber (_kind == "SR")] call BRM_FMK_fnc_getRadio;
		if (_currentRadio find _radio != 0 && _currentRadio find _otherRadio != 0) then {
			_unit linkItem _radio;
		};
	};
};

if (mission_ACRE2_enabled) exitWith {
	if (_kind == "BP") then {
		if (backpackItems _unit findIf { _x find _radio == 0 } == -1) then {
			if !(_unit canAddItemToBackpack _radio) then {
				if (isNil "_backpack") then {
					{ if (!isNil "_x") exitWith { _backpack = _x; }; } forEach [_bigBackpack, _commonBackpack, "B_AssaultPack_blk"];
				};
				[_unit, _backpack] call BRM_FMK_fnc_addEmptyBackpack;
			};
			_unit addItemToBackpack _radio;
		};
	} else {
		private _otherRadio = [_side, ["SR", "LR"] select parseNumber (_kind == "SR")] call BRM_FMK_fnc_getRadio;
		if (items _unit findIf { _x find _radio == 0 || _x find _otherRadio == 0 } == -1) then {
			_unit addItem _radio;
		};
	};
};

if (_unit getSlotItemName 611 find _radio != 0) then {
	_unit linkItem _radio;
};
