/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_postInit

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Addon framework post-init.

PARAMETERS:
    None.

USAGE:
    [] call BRM_FMK_Engine_fnc_postInit

RETURNS:
    Nothing.

================================================================================
*/

if (isNil "BRM_FMK_Engine_missionVersion") exitWith {};

BRM_FMK_Engine_postInitTime = diag_tickTime;

_this call BRM_FMK_Engine_fnc_loadSettings;
_this call BRM_FMK_Engine_fnc_assignSideProperties;

["LOCAL", "F_LOG", format ["STARTING MISSION '%1'", briefingName]] call BRM_FMK_fnc_doLog;
[] call BRM_FMK_Engine_fnc_loadContentCargo;

if (hasInterface) then {
	player createDiarySubject ["BRM_FMK_diary", "BromA Framework"];

	player createDiaryRecord ["BRM_FMK_diary", ["Credits", [
		"<img src='\broma_framework\assets\images\framework-logo.paa' width='512' height='128'/>",
		"",
		"Made possible using the BromA Framework, assembled by the BromA Mission Making Team @ https://broma.onozuka.info - all credits given to their respective creators."
	] joinString "<br />"], taskNull, "NONE", false];

	if (isMultiplayer) then {
		// Enable channels during briefing.
		0 spawn {
			private _disableChannels = getMissionConfigValue "disableChannels";
			if (!isNil "_disableChannels") then {
				_disableChannels = _disableChannels apply {
					if (_x isEqualType []) then {
						_x params ["_id", "_text", "_voice"];
						[_id, [_text == "true", _voice == "true"]]
					} else {
						[_x, false]
					}
				};

				{ _x select 0 enableChannel true; } forEach _disableChannels;
				sleep 0.001;
				{ _x select 0 enableChannel (_x select 1); } forEach _disableChannels;
			};
		};

		// Set default briefing channel to Side
		[{ (!isNull findDisplay 52 || !isNull findDisplay 53) && channelEnabled 1 select 0 }, { // RscDisplayServerGetReady, RscDisplayClientGetReady, Side channel re-enabled.
			setCurrentChannel 1;
		}] call CBA_fnc_waitUntilAndExecute;
	};
};

_this call BRM_FMK_Engine_fnc_defineGroups;
_this call BRM_FMK_Engine_fnc_createPlayerVehicles;
_this call BRM_FMK_Engine_fnc_readExtraction;

if (isServer) then {
	BRM_FMK_Engine_players = [[], [], []]; // Side A, Side B, Side C
	["BRM_FMK_Engine_initPlayerServer", {
		private _i = [side_a_side, side_b_side, side_c_side] find (_this call BIS_fnc_objectSide);
		if (_i != -1) then {
			BRM_FMK_Engine_players select _i pushBackUnique _this;
		};
	}] call CBA_fnc_addEventHandler;
};

// Disables object recognition to save performance.
if (mission_game_mode == "tvt") then { disableRemoteSensors true };

_this call BRM_FMK_Engine_fnc_initPlayer;
_this call BRM_FMK_Engine_fnc_loadBriefing;
_this call BRM_FMK_Engine_fnc_loadPlugins;

if (isServer) then {
	BRM_FMK_Engine_deaths = [0, 0, 0]; // Side A, Side B, Side C

	addMissionEventHandler ["EntityKilled", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];

		private _i = [side_a_side, side_b_side, side_c_side] find (_unit call BIS_fnc_objectSide);
		if (_i != -1) then {
			BRM_FMK_Engine_deaths set [_i, BRM_FMK_Engine_deaths#_i + 1];
		};
	}];
};

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

_this call BRM_FMK_Engine_fnc_endLoading;
