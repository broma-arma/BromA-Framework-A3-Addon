// ============================================================================
//  These are the default credits to everyone who contributed in order to make |
//                        this framework complete.                             |
//                                                                             |
//        I sincerely urge you not to remove this from your mission.           |
//                                                                             |
//              And most importantly, don't forget to add your name            |
//                        and mission version below!                           |
// ============================================================================
// execVM'd by Mission Framework <= 0.7.5

private _author = "Unknown";
private _version = "v0";

if ([BRM_version, [0, 7, 5]] call BRM_FMK_fnc_versionCompare > 0) then { // > v0.7.5
	_author = getText (missionConfigFile >> "Mission" >> "ScenarioData" >> "author");

	private _parts = missionName splitString "_";
	private _lastPart = _parts select count _parts - 1;
	if (_lastPart select [0, 1] == "v") then {
		_version = _lastPart;
	};

} else {
	_author = [mission_author_name] call BRM_FMK_fnc_verboseArray;
	_version = mission_version;
};

player createDiaryRecord ["Diary", ["Credits",
	"Current mission version " + _version + " made by " + _author + ".<br /><br />"
	+ "<img image='\broma_framework\assets\images\framework-logo.paa' width='512' height='128' /><br />"
	+ "Made possible using the BromA Framework, assembled by the BromA Mission Making Team @ http://broma.onozuka.info - all credits given to their respective creators."
]];
