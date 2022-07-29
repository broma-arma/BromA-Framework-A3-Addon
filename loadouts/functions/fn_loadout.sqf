/*
================================================================================

NAME:
    BRM_FMK_fnc_loadout

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Loads a loadout file.

PARAMETERS:
    0 - The loadout to load (STRING)

USAGE:
    ["RACS"] call BRM_FMK_fnc_loadout;

RETURNS:
    Nothing

================================================================================
*/

params ["_id", ["_structure", false, [false]], ["_defVar", "", [""]]];

private _var = format ["BRM_FMK_fnc_%1%2", ["faction", "structure"] select _structure, toUpper _id];
private _code = missionNamespace getVariable _var;
if (!isNil "_code") exitWith {
	if (_defVar != "") then {
		missionNamespace setVariable [_defVar, _code];
	};
	call _code
};

private _file = getText ([["BRM_FMK_Loadouts", ["Factions", "Structures"] select _structure, _id], configNull] call BIS_fnc_loadEntry);
if (_file != "" && { fileExists _file }) exitWith {
	_code = preprocessFileLineNumbers _file;
	if (!_structure) then {
		private _modFile = format ["loadouts\mods\%1.sqf", toLower _id];
		if (fileExists _modFile) then {
			_code = _code + toString [10] + preprocessFileLineNumbers _modFile;
		};
	};
	_code = compileFinal _code;

	missionNamespace setVariable [_var, _code];
	if (_defVar != "") then {
		missionNamespace setVariable [_defVar, _code];
	};
	call _code
};

if (_id != "DEFAULT") exitWith {
	["[WARN ] [Loadouts] Unknown %1 '%2', defaulting to 'default'", ["faction", "structure"] select _structure, _id] call BIS_fnc_error;
	["DEFAULT", _var] call BRM_FMK_fnc_loadout
};

["[ERROR] [Loadouts] Unknown %1 '%2'", ["faction", "structure"] select _structure, _id] call BIS_fnc_error;
