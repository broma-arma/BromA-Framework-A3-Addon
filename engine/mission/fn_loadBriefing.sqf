
// ============================================================================
//                                                                             |
//                    Executes all mission Briefings.                          |
//                                                                             |
// ============================================================================

0 spawn {
	[] execVM "broma_framework\credits.sqf";

	private _side = side player;
	private _sideIndex = [WEST, EAST, RESISTANCE, CIVILIAN] find _side;

	["LOCAL", "F_LOG", format ["PLAYER: ASSIGNING %1 BRIEFING", _side]] call BRM_FMK_fnc_doLog;

	private _breifing = call compile preprocessFileLineNumbers "mission\settings\briefings.sqf" select _sideIndex;
	if (_breifing != "") then {
		player createDiaryRecord ["Diary", ["Mission", _breifing], taskNull, "", false];
	};
};
