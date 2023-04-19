#include "script_component.hpp"

// ============================================================================
//                                                                             |
//                    Executes all mission Briefings.                          |
//                                                                             |
// ============================================================================

0 spawn {
	[] call compile preprocessFileLineNumbers "broma_framework\credits.sqf";

	private _side = side player;
	private _sideIndex = [WEST, EAST, RESISTANCE, CIVILIAN] find _side;

	["LOCAL", "F_LOG", format ["PLAYER: ASSIGNING %1 BRIEFING", _side]] call FUNCMAIN(doLog);

	if (fileExists "settings\briefings.sqf") then {
		private _breifing = call compile preprocessFileLineNumbers "settings\briefings.sqf" select _sideIndex;
		if (_breifing != "") then {
			player createDiaryRecord ["Diary", ["Mission", _breifing], taskNull, "", false];
		};
	};
};
