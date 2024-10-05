/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_loadBriefing

AUTHOR(s):
    Nife

DESCRIPTION:
    Loads mission briefing.

PARAMETERS:
    None.

USAGE:
    [] call BRM_FMK_Engine_fnc_loadBriefing;

RETURNS:
    Nothing.

================================================================================
*/

if (!hasInterface) exitWith {};

private _sideID = side player call BIS_fnc_sideID;

private ["_autoRadio", "_radioChannel", "_radioFreq"];
if (BRM_FMK_Engine_compatVersion == 0) then {
	_autoRadio = false;
	_radioChannel = "";
	_radioFreq = "";
};

private _briefing = (if (BRM_FMK_Engine_compatVersion == 0) then {[
	"east", "west", "ind", "civ",
	"unknown", "enemy", "friendly",
	"logic", "empty", "ambient"
]} else {[
	"opfor", "blufor", "indfor", "civfor",
	"unknown", "enemy", "friendly",
	"logic", "empty", "ambient"
]}) select _sideID;

private _file = format ["mission\briefings\%1%2.sqf", ["", "briefing-"] select (BRM_FMK_Engine_compatVersion == 0), _briefing];
private _exists = fileExists _file;
["LOCAL", "F_LOG", format ["PLAYER: %1 %2 BRIEFING", ["SKIPPING", "ASSIGNING"] select _exists, toUpper _briefing]] call BRM_FMK_fnc_doLog;
if (_exists) then {
	call compile preprocessFileLineNumbers _file;
};

// Append mission authors and version to Briefing > Mission diary record.
if (BRM_FMK_Engine_compatVersion == 0) then {
	{
		_x params ["_id", "_title", "_text", "_icon", "", "", "", "", "_record"];

		switch (trim _title) do {
			case "Radio information and Callsigns": {
				player removeDiaryRecord ["Diary", _record];
			};

			case "Mission": {
				private _version = format ["<br /><br /><font size='12'>Made by %1. (%2)</font>", [mission_author_name] call BRM_FMK_fnc_verboseArray, mission_version];
				player setDiaryRecordText [["Diary", _record], [_title, _text + _version, _icon]];
			};
		};
	} forEach (player allDiaryRecords "Diary");
} else {
	{
		_x params ["_id", "_title", "_text", "_icon", "", "", "", "", "_record"];

		if (trim _title == "Mission") exitWith {
			private _version = format ["<br /><br /><font size='12'>Made by %1. (%2)</font>", [mission_author_name] call BRM_FMK_fnc_verboseArray, mission_version];
			player setDiaryRecordText [["Diary", _record], [_title, _text + _version, _icon]];
		};
	} forEach (player allDiaryRecords "Diary");
};
