// ============================================================================
//  These are the default credits to everyone who contributed in order to make |
//                        this framework complete.                             |
//                                                                             |
//        I sincerely urge you not to remove this from your mission.           |
//                                                                             |
//              And most importantly, don't forget to add your name            |
//                        and mission version below!                           |
// ============================================================================

player createDiaryRecord ["BRM_FMK_diary", ["Credits", [
	"<img src='\broma_framework\assets\images\framework-logo.paa' width='512' height='128'/>",
	"",
	"Made possible using the BromA Framework, assembled by the BromA Mission Making Team @ https://broma.onozuka.info - all credits given to their respective creators."
] joinString "<br />"], taskNull, "NONE", false];

// Append mission authors and version to Briefing > Mission diary record.
{
	_x params ["_id", "_title", "_text", "_icon", "", "", "", "", "_record"];

	if (trim _title == "Mission") exitWith {
		private _version = format ["<br /><br /><font size='12'>Made by %1. (%2)</font>", [mission_author_name] call BRM_FMK_fnc_verboseArray, mission_version];
		player setDiaryRecordText [["Diary", _record], [_title, _text + _version, _icon]];
	};
} forEach (player allDiaryRecords "Diary");
