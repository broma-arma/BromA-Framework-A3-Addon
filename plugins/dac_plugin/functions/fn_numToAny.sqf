/*
================================================================================

NAME:
    BRM_FMK_DAC_fnc_numToAny

AUTHOR(s):
    Nife

DESCRIPTION:
    Converts a DAC number into a value

PARAMETERS:
    0 - The value type that is being converted: "SIDE", "SKILL", or "FACTION" (SIDE)
    1 - The value to convert. (NUMBER)

USAGE:
    ["SKILL", 1] call BRM_FMK_DAC_fnc_numToAny;

RETURNS:
    The value. (ANY)

================================================================================
*/

params ["_type", "_num"];

if !(_num isEqualType 0) then {
	_num = parseNumber _num;
};

switch (_type) do {
	case "SIDE": {
		if (_num < 0 || _num > 3) exitWith { ["[WARN ] [DAC Plugin] Unknown side number %1, defaulting to WEST", _num] call BIS_fnc_error; WEST };

		[WEST, EAST, RESISTANCE, CIVILIAN] select _num
	};

	case "SKILL": {
		if (_num < 0 || _num > 3) exitWith { ["[WARN ] [DAC Plugin] Unknown skill number %1, defaulting to 'easy'", _num] call BIS_fnc_error; "easy" };

		["easy", "normal", "stealth", "hard"] select _num
	};

	case "FACTION": {
		if (_num < 0 || _num > 16) exitWith { ["[WARN ] [DAC Plugin] Unknown faction number %1, defaulting to 'auto'", _num] call BIS_fnc_error; "auto" };

		["auto", "vanilla", "RACS", "SLA", "MUJAHIDEEN", "ANA", "AHKMA-PMC", "CHEDAKI", "MARINES", "IONPMC", "TKMILITIA", "FINNS", "CSAT", "NATO", "AAF", "FIA", "VDV"] select _num
	};

	default {
		["[ERROR] [DAC Plugin] Unknown type: %1", _type] call BIS_fnc_error;
	};
};
