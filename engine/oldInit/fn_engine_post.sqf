/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_engine_post

AUTHOR(s):
    Nife

DESCRIPTION:
    Is called every mission on post-init.

PARAMETERS:
    None.

USAGE:
    [] call BRM_FMK_Engine_fnc_engine_post

RETURNS:
    Nothing.

================================================================================
*/

enableSentences false; // Hacky shit to try to stop low FPS.

if (isClass (configFile >> "CfgPatches" >> "zen_modules") && !isNil "zen_modules_saved") then {
	// Change defaults of Zeus Enhanced's Update Editable Objects module
	private _selections = zen_modules_saved getVariable ["zen_modules_editableObjects", [1, 1, 0, 100, [true, true, true, true]]];
	_selections set [1, 0]; // All Curators: No
	_selections set [2, 1]; // Range Mode: All Mission Objects
	private _filter = _selections select 4;
	_filter set [0, false]; // All: No
	_filter set [3, false]; // Static: No
	zen_modules_saved setVariable ["zen_modules_editableObjects", _selections];
};

if (hasInterface) then {
	player createDiarySubject ["BRM_FMK_diary", "BromA Framework"];

	player createDiaryRecord ["BRM_FMK_diary", ["Credits", [
		"<img src='\broma_framework\assets\images\framework-logo.paa' width='512' height='128'/>",
		"",
		"Made possible using the BromA Framework, assembled by the BromA Mission Making Team @ https://broma.onozuka.info - all credits given to their respective creators."
	] joinString "<br />"], taskNull, "NONE", false];

	if (isMultiplayer) then {
		// Set default briefing channel to Side
		[{ (!isNull findDisplay 52 || !isNull findDisplay 53) && channelEnabled 1 select 0 }, { // RscDisplayServerGetReady, RscDisplayClientGetReady, Side channel re-enabled.
			setCurrentChannel 1;
		}] call CBA_fnc_waitUntilAndExecute;
	};
};
