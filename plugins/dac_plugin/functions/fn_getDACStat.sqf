/*
================================================================================

NAME:
    BRM_FMK_DAC_fnc_getDACStat

AUTHOR(s):
    Nife

DESCRIPTION:
    Converts a string value into a DAC number

PARAMETERS:
    0 - The value type that is being converted: "SIDE", "SKILL", or "FACTION" (SIDE)
    1 - The value to convert. (STRING)

USAGE:
    ["SKILL", "decent"] call BRM_FMK_DAC_fnc_getDACStat;

RETURNS:
    DAC number. (NUMBER)

================================================================================
*/

#include "includes\dictionary.sqf"

params ["_stat", "_value"];

if !(_value isEqualType "") then {
	_value = str _value;
};
_value = toLower _value;

switch (_stat) do {
	case "SIDE": {
		switch (_value) do {
			case CASE_OPFOR: { 0 };
			case CASE_BLUFOR: { 1 };
			case CASE_INDFOR: { 2 };
			case CASE_CIVILIAN: { 3 };
			case "friendly";
			case "side_a": { [_stat, side_a_side] call BRM_FMK_DAC_fnc_getDACStat };
			case "enemy";
			case "side_b": { [_stat, side_b_side] call BRM_FMK_DAC_fnc_getDACStat };
			case "neutral";
			case "side_c": { [_stat, side_c_side] call BRM_FMK_DAC_fnc_getDACStat };
			default { ["[WARN ] [DAC Plugin] Unknown side '%1', defaulting to 'enemy'", _value] call BIS_fnc_error; [_stat, side_b_side] call BRM_FMK_DAC_fnc_getDACStat };
		};
	};

	case "SKILL": {
		switch (_value) do {
			case CASE_SKILL_EASY: { 0 };
			case CASE_SKILL_NORMAL: { 1 };
			case CASE_SKILL_STEALTH: { 2 };
			case CASE_SKILL_HARD: { 3 };
			default { ["[WARN ] [DAC Plugin] Unknown skill '%1', defaulting to 'normal'", _value] call BIS_fnc_error; 1 };
		};
	};
	case "FACTION": {
		private _index = ([
			"default", "vanilla", "racs", "sla", "mujahideen", "ana", "ahkma-pmc", "chedaki",
			"marines", "ionpmc", "tkmilitia", "finns", "csat", "nato", "aaf", "fia", "vdv"
		] find _value) + 1;

		if (_index == 0) then {
			_index = switch (_value) do {
				case "side_a": { side_a_side };
				case "side_b": { side_b_side };
				case "side_c": { side_c_side };
				case CASE_BLUFOR: { west };
				case CASE_OPFOR: { east };
				case CASE_INDFOR: { resistance };
				default { ["[WARN ] [DAC Plugin] Unknown faction '%1', defaulting to 'default'", _value] call BIS_fnc_error; 1 };
			};

			if (_index isEqualType sideUnknown) then {
				_index = [_stat, [_index, "FACTION"] call BRM_FMK_fnc_getSideInfo] call BRM_FMK_DAC_fnc_getDACStat;
			};
		};

		_index
	};
	default {
		["[ERROR] [DAC Plugin] Unknown stat: %1", _stat] call BIS_fnc_error; 0
	};
};
