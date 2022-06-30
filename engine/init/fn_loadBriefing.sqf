
// ============================================================================
//                                                                             |
//                    Executes all mission Briefings.                          |
//                                                                             |
// ============================================================================

0 spawn {
	[] execVM "broma_framework\credits.sqf";

	private _side = side player;
	private _sideIndex = [WEST, EAST, RESISTANCE, CIVILIAN] find _side;

	private ["_radioChannel", "_radioFreq"];
	if ("radiofreq" in usedPlugins) then {
		waitUntil{ !isNil "mission_radiochannels_CIV" }; // radiofreq plugin initialized
		// TODO missionNamespace getVariable?
		_radioChannel = [mission_radiochannels_BLU, mission_radiochannels_OP, mission_radiochannels_IND, mission_radiochannels_CIV] select _sideIndex;
		_radioFreq = [mission_radiochannels_add_BLU, mission_radiochannels_add_OP, mission_radiochannels_add_IND, mission_radiochannels_add_CIV] select _sideIndex;
	};

	["LOCAL", "F_LOG", format ["PLAYER: ASSIGNING %1 BRIEFING", _side]] call BRM_FMK_fnc_doLog;

	// TODO Rename briefing files to match `toLower str side`? ("west", "east", "guer", "civ")
	call compile preprocessFileLineNumbers format ["mission\briefings\briefing-%1.sqf", ["west", "east", "ind", "civ"] select _sideIndex];
};
