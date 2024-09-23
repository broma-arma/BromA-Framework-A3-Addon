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

if (isNil "BRM_FMK_missionVersion") exitWith {};

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

_this call BRM_FMK_Engine_fnc_logPlugins;
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
	}] CBA_fnc_addEventHandler;
};

_this call BRM_FMK_Engine_fnc_initPlayer;
_this call BRM_FMK_Engine_fnc_loadBriefing;

// Plugins postInit
{
	private _configName = configName _x;
	private _cfgPlugin = configFile >> "BRM_FMK" >> "Plugins" >> _configName;
	if (isClass _cfgPlugin) then {
		private _fnc = missionNamespace getVariable format ["%1_fnc_postInit", [_cfgPlugin, "tag", format ["BRM_FMK_Plugin_%1", _configName]] call BIS_fnc_returnConfigEntry];
		if (!isNil "_fnc") then {
			_this call _fnc;
		};
	};
} forEach ("true" configClasses (missionConfigFile >> "CfgPlugins"));

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
