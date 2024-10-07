if (!hasInterface || { player isKindOf "VirtualSpectator_F" }) exitWith {};

BRM_FMK_Plugin_TeamRoster_diary = ["Diary", player createDiaryRecord ["Diary", ["Team Roster", "Loading..."]]];

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
