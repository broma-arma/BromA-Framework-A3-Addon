if (!hasInterface || { player_is_spectator }) exitWith {};

0 spawn {
	waitUntil {!isNull player && !isNil "mission_groups_init" && {mission_groups_init}};

	BRM_FMK_Plugin_TeamRoster_diary = ["Diary", player createDiaryRecord ["Diary", ["Team Roster", "Loading..."], taskNull, "NONE", false]];

	{
		params ["_display", "_subjectList", "_subject", "_record", "_recordId"];

		private _updaterDone = isNil "BRM_FMK_Plugin_TeamRoster_updater" || { scriptDone BRM_FMK_Plugin_TeamRoster_updater };
		if (_subject == "Diary" && _record == "Team Roster") then {
			0 call BRM_FMK_Plugin_TeamRoster_fnc_update;

			if (_updaterDone) then {
				BRM_FMK_Plugin_TeamRoster_updater = 0 spawn {
					while { true } do {
						uiSleep 1;
						0 call BRM_FMK_Plugin_TeamRoster_fnc_update;
					};
				};
			};
		} else {
			if (!_updaterDone) then {
				terminate BRM_FMK_Plugin_TeamRoster_updater;
			};
		};
	} call BRM_FMK_Engine_fnc_onDiaryChanged;
};
