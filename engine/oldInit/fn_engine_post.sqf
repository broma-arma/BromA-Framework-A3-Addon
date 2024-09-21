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

// Hacky shit to try to stop low FPS. ==========================================

enableSentences false;

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

if (missionNamespace getVariable ["BRM_FMK_frameworkMission", false]) then {
	if (hasInterface) then {
		if (isMultiplayer) then {
			// Set default briefing channel to Side
			[{ (!isNull findDisplay 52 || !isNull findDisplay 53) && channelEnabled 1 select 0 }, { // RscDisplayServerGetReady, RscDisplayClientGetReady, Side channel re-enabled.
				setCurrentChannel 1;
			}] call CBA_fnc_waitUntilAndExecute;
		};

		0 spawn {
			sleep 1; // Post briefing
			if ("commander_lock" call BRM_FMK_fnc_isPluginActive && { side player in locked_sides }) then {
				// Force enable text channels until commander starts mission.
				private _channelSettings = [];
				for "_i" from 0 to 5 do {
					private _channelEnabled = channelEnabled _i;
					_channelSettings pushBack +_channelEnabled;
					_channelEnabled set [0, true];
					_i enableChannel _channelEnabled;
				};

				[{ !(side player in locked_sides) }, {
					{ _forEachIndex enableChannel _x; } forEach _this;

					// Group > Vehicle > Direct > Side > Global > Command > Group (All disabled)
					setCurrentChannel ([3, 4, 5, 1, 0, 2, 3] select ([3, 4, 5, 1, 0, 2] findIf { channelEnabled _x select 0 }));
				}, _channelSettings] call CBA_fnc_waitUntilAndExecute;
			};
		};
	};
};
