
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

	private _titles = ["Enemy Forces", "Support", "Mission", "Situation"];
	{
		if (_x != "") then {
			player createDiaryRecord [_titles select _forEachIndex, ["Enemy Forces", _x];
		};
	} forEach (call compile preprocessFileLineNumbers "mission\settings\briefings.sqf" select _sideIndex);
};
