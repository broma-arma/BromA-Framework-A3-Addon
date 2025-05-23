/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_getLoadoutCode

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Gets a faction or structure code.

PARAMETERS:
    0 - The loadout ID to load (STRING)
    1 - (OPTIONAL) 0 for faction, 1 for structure, 2 for faction mod. Default 0 (NUMBER)

USAGE:
	["RACS"] call BRM_FMK_Engine_fnc_getLoadoutCode;
	["HIGH_TIER", 1] call BRM_FMK_Engine_fnc_getLoadoutCode;

RETURNS:
   Loadout code (CODE)

================================================================================
*/

#define LOADOUT_TYPE_FACTION 0
#define LOADOUT_TYPE_STRUCTURE 1
#define LOADOUT_TYPE_FACTION_MOD 2

params ["_id", ["_type", LOADOUT_TYPE_FACTION, [0]]];

if (isNil "BRM_FMK_Engine_fnc_getLoadoutCodeCache") then { BRM_FMK_Engine_fnc_getLoadoutCodeCache = createHashMap; };

private _typeStr = ["Faction", "Structure", "FactionMod"] select _type;
private _key = format ["%1%2", _typeStr, toUpper _id];
BRM_FMK_Engine_fnc_getLoadoutCodeCache getOrDefaultCall [_key, {
	// Note: Don't use `exitWith`
	if (_type < LOADOUT_TYPE_FACTION_MOD) then {
		private _cfgSource = -1;
		private _cfg = {
			private _cfg = _x >> "BRM_FMK" >> _typeStr + "s" >> _id;
			if (!isNull _cfg && (isArray _cfg || isText _cfg)) exitWith { _cfgSource = _forEachIndex; _cfg };
			configNull
		} forEach [missionConfigFile, campaignConfigFile, configFile];

		if (_type == LOADOUT_TYPE_STRUCTURE && isArray _cfg) then { // Deprecated structure
			[getArray _cfg select 0, _type] call BRM_FMK_Engine_fnc_getLoadoutCode
		} else {
			private _parentCode = "";
			private _file = if (isArray _cfg) then {
				getArray _cfg params ["_parentID", "_file"];
				_parentCode = format ["call ([""%1"", 0] call BRM_FMK_Engine_fnc_getLoadoutCode);%2", _parentID, toString [10]];
				_file
			} else {
				getText _cfg
			};

			// Faction mod
			if (BRM_FMK_Engine_compatVersion > 0 && _cfgSource == 2 && { fileExists ("mission\loadouts\factions\" + _id + ".sqf") }) then {
				_parentCode = _parentCode + format ["call ([""%1"", 2] call BRM_FMK_Engine_fnc_getLoadoutCode);%2", _id, toString [10]];
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
					["Warning: Unknown %1 '%2', defaulting to 'default'", toLower _typeStr, _id] call BIS_fnc_error;
					["DEFAULT", _type] call BRM_FMK_Engine_fnc_getLoadoutCode
				} else {
					["Error: Unknown %1 '%2'", toLower _typeStr, _id] call BIS_fnc_error;
					{}
				}
			}
		}
	} else {
		private _file = "mission\loadouts\factions\" + _id + ".sqf";
		compileScript [_file, true, format ["
private _fnc_scriptNameParent = if (isNil '_fnc_scriptName') then {'%1'} else {_fnc_scriptName};
private _fnc_scriptName = '%1';
scriptName _fnc_scriptName;
%3line 1 ""%2 [%1]""
", _key, _file, "#"]]
	}
}, true]
