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

["LOCAL", "F_LOG", format ["STARTING MISSION '%1'", briefingName]] call BRM_FMK_fnc_doLog;

_this call BRM_FMK_Engine_fnc_loadSettings;
_this call BRM_FMK_Engine_fnc_assignSideProperties;
[] call BRM_FMK_Engine_fnc_loadContentCargo;

if (hasInterface) then {
	// Remove side-specific markers
	private _playerSide = side player;
	{
		_x params ["_side", "_layerName"];

		if (_playerSide != _side) then {
			private _layerEntities = getMissionLayerEntities _layerName;
			if (_layerEntities isNotEqualTo []) then {
				{
					deleteMarkerLocal _x;
				} forEach (_layerEntities select 1);
			};
		};
	} forEach [
		[side_a_side, "SIDE_A"],
		[side_b_side, "SIDE_B"],
		[side_c_side, "SIDE_C"],
		[BLUFOR, "BLU"],
		[OPFOR, "OP"],
		[INDEPENDENT, "IND"],
		[CIVILIAN, "CIV"]
	];

	player createDiarySubject ["BRM_FMK_diary", "BromA Framework"];

	player createDiaryRecord ["BRM_FMK_diary", ["Credits", [
		"<img src='\broma_framework\assets\images\framework-logo.paa' width='512' height='128'/>",
		"",
		"Made possible using the BromA Framework, assembled by the BromA Mission Making Team @ https://broma.onozuka.info - all credits given to their respective creators."
	] joinString "<br />"], taskNull, "NONE", false];

	if (isMultiplayer && getClientStateNumber < /*"BRIEFING READ"*/10) then {
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

	_this call BRM_FMK_Engine_fnc_mapHold;

	_this call BRM_FMK_Engine_fnc_logParams;
};

_this call BRM_FMK_Engine_fnc_defineGroups;
_this call BRM_FMK_Engine_fnc_createPlayerVehicles;
_this call BRM_FMK_Engine_fnc_readExtraction;

_this call BRM_FMK_Engine_fnc_initPlayer;
_this call BRM_FMK_Engine_fnc_loadPlugins;
_this call BRM_FMK_Engine_fnc_loadBriefing;

if (BRM_FMK_Engine_compatVersion > 0) then {
	BRM_FMK_Engine_fnc_missionCargoList = compileFinal (if (fileExists "mission\loadouts\cargo.sqf") then { preprocessFileLineNumbers "mission\loadouts\cargo.sqf" } else { {} });
	BRM_FMK_Engine_fnc_cargoList = compileFinal preprocessFileLineNumbers "\broma_framework\loadouts\cargo.sqf";
} else {
	if (read_local_structure_specific isNotEqualTo [] || read_local_cargo) then {
		GUN = 0;
		RAMMO = 1;
		GL = 2;
	};
	BRM_FMK_Engine_fnc_cargoList = compileFinal preprocessFileLineNumbers (["\broma_framework\loadouts\cargo.sqf", "mission\loadouts\cargo-list.sqf"] select read_local_cargo);
};

if (isServer) then {
	BRM_FMK_Engine_players = [[], [], []]; // Side A, Side B, Side C
	["BRM_FMK_Engine_initPlayerServer", {
		private _i = [side_a_side, side_b_side, side_c_side] find (_this call BIS_fnc_objectSide);
		if (_i != -1) then {
			BRM_FMK_Engine_players select _i pushBackUnique _this;
		};
	}] call CBA_fnc_addEventHandler;

	BRM_FMK_Engine_deaths = [0, 0, 0]; // Side A, Side B, Side C
	addMissionEventHandler ["EntityKilled", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];

		private _i = [side_a_side, side_b_side, side_c_side] find (_unit call BIS_fnc_objectSide);
		if (_i != -1) then {
			BRM_FMK_Engine_deaths set [_i, BRM_FMK_Engine_deaths#_i + 1];
		};
	}];

	call BRM_FMK_Engine_fnc_gc;
};

// Disables object recognition to save performance.
if (mission_game_mode == "tvt") then { disableRemoteSensors true };

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

if (BRM_FMK_Engine_compatVersion > 0) then {
	["CAManBase", "InitPost", { _this call BRM_FMK_Engine_fnc_initAI; }, true, ["VirtualMan_F", "B_UAV_AI", "O_UAV_AI", "UAV_AI_base_F"], true] call CBA_fnc_addClassEventHandler;
};

pluginsLoaded = true; // Backward compatibility (Used by assignLoadout, assignCargo, and dac_config_creator)

private _scripts = _this call BRM_FMK_Engine_fnc_loadScripts;

BRM_FMK_Engine_postInitTime = diag_tickTime - BRM_FMK_Engine_postInitTime;
BRM_FMK_Engine_initTime = BRM_FMK_Engine_preInitTime + BRM_FMK_Engine_postInitTime;
["LOCAL", "F_LOG", format ["%1 initialized in %2 seconds (Pre: %3, Post: %4)", getText (configFile >> "CfgPatches" >> "BRM_FRAMEWORK" >> "versionDesc"), BRM_FMK_Engine_initTime, BRM_FMK_Engine_preInitTime, BRM_FMK_Engine_postInitTime]] call BRM_FMK_fnc_doLog;

["BRM_FMK_Engine_initialized"] call CBA_fnc_localEvent;
BRM_FMK_Engine_initialized = true;

if (BRM_FMK_Engine_compatVersion == 0) then {
	[{ _this findif { !scriptDone _x } == -1 }, {
		["BRM_FMK_initialized"] call CBA_fnc_localEvent;
		BRM_FMK_initialized = true;
		["LOCAL", "F_LOG", format ["MISSION SCRIPTS INITIALIZED @ %1", time]] call BRM_FMK_fnc_doLog;
	}, _scripts] call CBA_fnc_waitUntilAndExecute;
} else {
	_scripts spawn {
		sleep 0.001;

		{
			[] call _x;
		} forEach _this;

		["BRM_FMK_initialized"] call CBA_fnc_localEvent;
		BRM_FMK_initialized = true;
		["LOCAL", "F_LOG", format ["MISSION SCRIPTS INITIALIZED @ %1", time]] call BRM_FMK_fnc_doLog;
	}
};
