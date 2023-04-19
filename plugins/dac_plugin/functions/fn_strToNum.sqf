#include "script_component.hpp"
/*
================================================================================

NAME:
    BRM_FMK_DAC_fnc_strToNum

AUTHOR(s):
    Nife

DESCRIPTION:
    Converts a string value into a DAC number

PARAMETERS:
    0 - The type that is being converted: "SIDE", "SKILL", or "FACTION" (STRING)
    1 - The string to convert. (STRING)

USAGE:
    ["SKILL", "decent"] call BRM_FMK_DAC_fnc_strToNum;

RETURNS:
    DAC number. (NUMBER)

================================================================================
*/

#include "includes\dictionary.sqf"

params ["_type", "_str"];

if !(_str isEqualType "") then {
	_str = str _str;
};
_str = toLower _str;

switch (_type) do {
	case "SIDE": {
		switch (_str) do {
			case CASE_OPFOR: { 0 };
			case CASE_BLUFOR: { 1 };
			case CASE_INDFOR: { 2 };
			case CASE_CIVILIAN: { 3 };
			case "friendly";
			case "side_a": { [_type, side_a_side] call FUNC(strToNum) };
			case "enemy";
			case "side_b": { [_type, side_b_side] call FUNC(strToNum) };
			case "neutral";
			case "side_c": { [_type, side_c_side] call FUNC(strToNum) };
			default { ["[WARN ] [DAC Plugin] Unknown side '%1', defaulting to 'enemy'", _str] call BIS_fnc_error; [_type, side_b_side] call FUNC(strToNum) };
		};
	};

	case "SKILL": {
		switch (_str) do {
			case CASE_SKILL_EASY: { 0 };
			case CASE_SKILL_NORMAL: { 1 };
			case CASE_SKILL_STEALTH: { 2 };
			case CASE_SKILL_HARD: { 3 };
			default { ["[WARN ] [DAC Plugin] Unknown skill '%1', defaulting to 'normal'", _str] call BIS_fnc_error; 1 };
		};
	};
	case "FACTION": {
		if ([BRM_version, [0, 7, 5]] call FUNCMAIN(versionCompare) <= 0) then {
			private _num = ([
				"default", "vanilla", "racs", "sla", "mujahideen", "ana", "ahkma-pmc", "chedaki",
				"marines", "ionpmc", "tkmilitia", "finns", "csat", "nato", "aaf", "fia", "vdv"
			] find _str) + 1;

			if (_num == 0) then {
				_num = switch (_str) do {
					case "side_a": { side_a_side };
					case "side_b": { side_b_side };
					case "side_c": { side_c_side };
					case CASE_BLUFOR: { west };
					case CASE_OPFOR: { east };
					case CASE_INDFOR: { resistance };
					default { ["[WARN ] [DAC Plugin] Unknown faction '%1', defaulting to 'default'", _str] call BIS_fnc_error; 1 };
				};

				if (_num isEqualType sideUnknown) then {
					_num = [_type, [_num, "FACTION"] call FUNCMAIN(getSideInfo)] call FUNC(strToNum);
				};
			};

			_num
		} else {
			private _side = switch (_str) do {
				case "side_a": { side_a_side };
				case "side_b": { side_b_side };
				case "side_c": { side_c_side };
				case CASE_BLUFOR: { west };
				case CASE_OPFOR: { east };
				case CASE_INDFOR: { resistance };
			};
			if (!isNil "_side") then {
				_str = [_side, "FACTION"] call FUNCMAIN(getSideInfo);
			};

			if (_str != "auto") then {
				private _factionFile = getText ([[GVARMAIN(Loadouts), "Factions", _str], configNull] call BIS_fnc_loadEntry);
				if (_factionFile == "" || { !fileExists _factionFile }) then {
					["[WARN ] [DAC Plugin] Unknown faction '%1', defaulting to 'auto'", _str] call BIS_fnc_error;
					_str = "auto";
				};
			};
			_str = toUpper _str;
			private _num = GVAR(strToNum_factions) find _str;
			if (_num == -1) then {
				_num = GVAR(strToNum_factions) pushBack _str;
			};
			_num + 1
		};
	};
	default {
		["[ERROR] [DAC Plugin] Unknown type: %1", _type] call BIS_fnc_error; 0
	};
};
