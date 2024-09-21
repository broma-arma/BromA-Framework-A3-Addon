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

0 spawn {
	private ["_radioChannel", "_radioFreq"];

	player createDiaryRecord ["BRM_FMK_diary", ["Credits", [
		"<img src='\broma_framework\assets\images\framework-logo.paa' width='512' height='128'/>",
		"",
		"Made possible using the BromA Framework, assembled by the BromA Mission Making Team @ https://broma.onozuka.info - all credits given to their respective creators."
	] joinString "<br />"], taskNull, "NONE", false];

	private _sideIndex = [WEST, EAST, RESISTANCE, CIVILIAN] find side player;
	private _autoRadio = "radiofreq" call BRM_FMK_fnc_isPluginActive;
	if (_autoRadio) then {
		private _autoRadioSide = ["BLU", "OP", "IND", "CIV"] select _sideIndex;
		private _radioChannelVar = format ["mission_radiochannels_%1", _autoRadioSide];
		private _radioFreqVar = format ["mission_radiochannels_add_%1", _autoRadioSide];
		waitUntil { !isNil _radioChannelVar && !isNil _radioFreqVar };
		_radioChannel = missionNamespace getVariable _radioChannelVar;
		_radioFreq = missionNamespace getVariable _radioFreqVar;
	};

	["LOCAL", "F_LOG", format ["PLAYER: ASSIGNING %1 BRIEFING", ["WEST", "EAST", "INDEPENDENT", "CIVILIAN"] select _sideIndex]] call BRM_FMK_fnc_doLog;
	call compile preprocessFileLineNumbers format ["mission\\briefings\\briefing-%1.sqf", ["west", "east", "ind", "civ"] select _sideIndex];

	// Append mission authors and version to Briefing > Mission diary record.
	{
		_x params ["_id", "_title", "_text", "_icon", "", "", "", "", "_record"];

		if (trim _title == "Mission") exitWith {
			private _version = format ["<br /><br /><font size='12'>Made by %1. (%2)</font>", [mission_author_name] call BRM_FMK_fnc_verboseArray, mission_version];
			player setDiaryRecordText [["Diary", _record], [_title, _text + _version, _icon]];
		};
	} forEach (player allDiaryRecords "Diary");

};
