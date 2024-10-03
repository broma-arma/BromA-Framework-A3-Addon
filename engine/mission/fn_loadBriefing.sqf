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

0 spawn {
	private _sideID = side player call BIS_fnc_sideID;

	private ["_autoRadio", "_radioChannel", "_radioFreq"];
	if (BRM_FMK_Engine_compatVersion == 0) then {
		_autoRadio = "radiofreq" call BRM_FMK_fnc_isPluginActive;
		if (_autoRadio) then {
			private _autoRadioSide = ["OP", "BLU", "IND", "CIV", "CIV", "CIV", "CIV", "CIV", "CIV", "CIV"] select _sideID;
			private _radioChannelVar = format ["mission_radiochannels_%1", _autoRadioSide];
			private _radioFreqVar = format ["mission_radiochannels_add_%1", _autoRadioSide];
			waitUntil { !isNil _radioChannelVar && !isNil _radioFreqVar };
			_radioChannel = missionNamespace getVariable _radioChannelVar;
			_radioFreq = missionNamespace getVariable _radioFreqVar;
		};
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
	{
		_x params ["_id", "_title", "_text", "_icon", "", "", "", "", "_record"];

		if (trim _title == "Mission") exitWith {
			private _version = format ["<br /><br /><font size='12'>Made by %1. (%2)</font>", [mission_author_name] call BRM_FMK_fnc_verboseArray, mission_version];
			player setDiaryRecordText [["Diary", _record], [_title, _text + _version, _icon]];
		};
	} forEach (player allDiaryRecords "Diary");
};
