/*
================================================================================

NAME:
    BRM_FMK_fnc_getLoadoutCode

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Gets a faction or structure code.

PARAMETERS:
    0 - The loadout ID to load (STRING)
    1 - (OPTIONAL) true for structure, false for faction. Default false (BOOLEAN)

USAGE:
	["RACS"] call BRM_FMK_fnc_getLoadoutCode;
	["HIGH_TIER", true] call BRM_FMK_fnc_getLoadoutCode;

RETURNS:
   Loadout code (CODE)

================================================================================
*/

params ["_id", ["_structure", false, [false]]];

if (isNil "BRM_FMK_fnc_getLoadoutCodeCache") then { BRM_FMK_fnc_getLoadoutCodeCache = createHashMap; };

private _type = ["Faction", "Structure"] select _structure;
private _key = format ["%1%2", _type, toUpper _id];
BRM_FMK_fnc_getLoadoutCodeCache getOrDefaultCall [_key, {
	private _cfg = [["BRM_FMK", _type + "s", _id], configNull] call BIS_fnc_loadEntry;

	if (_structure && isArray _cfg) then { // Note: Don't use `exitWith`
		[getArray _cfg select 0, _structure] call BRM_FMK_fnc_getLoadoutCode
	} else {
		private _parentCode = "";
		private _file = if (isArray _cfg) then {
			getArray _cfg params ["_parentID", "_file"];
			_parentCode = format ["call ([""%1"", false] call BRM_FMK_fnc_getLoadoutCode);%2", _parentID, toString [10]];
			_file
		} else {
			getText _cfg
		};

		if (_file != "" && { fileExists _file }) then {
			compileScript [_file, true, format ["
private _fnc_scriptNameParent = if (isNil '_fnc_scriptName') then {'%1'} else {_fnc_scriptName};
private _fnc_scriptName = '%1';
scriptName _fnc_scriptName;
%3line 1 ""%2 [%1]""
%4", _key, _file, "#", _parentCode]]
		} else {
			if (_id != "DEFAULT") then {
				["Warning: Unknown %1 '%2', defaulting to 'default'", toLower _type, _id] call BIS_fnc_error;
				["DEFAULT", _structure] call BRM_FMK_fnc_getLoadoutCode
			} else {
				["Error: Unknown %1 '%2'", toLower _type, _id] call BIS_fnc_error;
				{}
			}
		}
	}
}, true]
