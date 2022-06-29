/*
================================================================================

NAME:
    BRM_FMK_fnc_faction

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Loads a faction file.

PARAMETERS:
    0 - The faction to load (STRING)

USAGE:
    ["RACS"] call BRM_FMK_fnc_faction;

RETURNS:
    Nothing

================================================================================
*/

params ["_faction", ["_defVar", "", [""]]];

private _var = format ["BRM_FMK_fnc_faction%1", toUpper _faction];
private _code = missionNamespace getVariable _var;
if (!isNil "_code") exitWith {
	if (_defVar != "") then {
		missionNamespace setVariable [_defVar, _code];
	};
	call _code
};

private _file = format ["\broma_framework\loadouts\factions\%1.sqf", toLower _faction];
if (fileExists _file) exitWith {
	_code = compile preprocessFileLineNumbers _file
	missionNamespace setVariable [_var, _code];
	if (_defVar != "") then {
		missionNamespace setVariable [_defVar, _code];
	};
	call _code
};

if (_faction != "DEFAULT") exitWith {
	["[WARN ] [Loadouts] Unknown faction '%1', defaulting to 'default'", _faction] call BIS_fnc_error;
	["DEFAULT", _var] call BRM_FMK_fnc_faction
};

["[ERROR] [Loadouts] Unknown faction '%1'", _faction] call BIS_fnc_error;
