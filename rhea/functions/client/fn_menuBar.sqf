#include "../../defines.hpp"

TRACE_1("MenuBar: %1", _this);

disableSerialization;

params ["_control", "_configPath", "_action"];

switch (_action) do {
	case "OnLoad": {
		private _fnc_menuConfig = {
			if (_this isEqualTo []) exitWith { configNull };

			private _cfg = _configPath >> "Items";
			{
				_cfg = _configPath >> "Items" >> (getArray (_cfg >> "items") select _x);
			} forEach _this;

			_cfg
		};

		private _fnc_compileProperty = {
			params ["_property", ["_default", nil]];

			private _value = getText (_cfgMenu >> _property);
			if (_value == "") exitWith { _default };

			_value = compile _value;
			if (isNil "_value") exitWith { _default };

			_value = call _value;
			if (isNil "_value") exitWith { _default };

			_value
		};

		private _disabledPaths = [];
		private _fnc_initMenu = {
			private _path = _this;
			private _cfgMenu = _path call _fnc_menuConfig;
			private _size = _control menuSize _path;

			private _enable = ["BRM_FMK_RHEA_enable", true] call _fnc_compileProperty;
			if (_enable) then {
				if (_size == 0) then {
					private _menuData = _control menuData _path;
					if (_menuData != "") then {
						_control menuSetAction [_path, format ["_this + ['%1'] call BRM_FMK_RHEA_fnc_menuBar;", _menuData]];
					};

					private _checked = ["BRM_FMK_RHEA_checked"] call _fnc_compileProperty;
					if (!isNil "_checked") then {
						_control menuSetCheck [_path, _checked];
					};
				} else {
					for "_i" from 0 to _size - 1 do {
						(_this + [_i]) call _fnc_initMenu;
					};
				};
			} else {
				_disabledPaths pushBack _path;
			};
		};
		[] call _fnc_initMenu;

		reverse _disabledPaths;
		{ _control menuDelete _x; } forEach _disabledPaths;
	};

	case "ShowAI";
	case "ShowDead": {
		private _var = "RHEA_cfg_" + (toLower _action);
		profileNamespace setVariable [_var, !(profileNamespace getVariable [_var, true])];
		saveProfileNamespace;
		(ctrlParent _control displayCtrl 2100) call BRM_FMK_RHEA_fnc_listPlayers;
	};
	case "CuratorCamEars": {
		if (HAS_ADDON("tfar_core")) then {
			TFAR_curatorCamEars = !(missionNamespace getVariable ["TFAR_curatorCamEars", false]);
		} else {
			"tfar_core addon not loaded" call BRM_FMK_RHEA_fnc_message;
		};
	};

	case "Zeus": {
		[player] remoteExec [["BRM_FMK_RHEA_SERVER_fnc_stopZeus", "BRM_FMK_RHEA_SERVER_fnc_startZeus"] select isNull getAssignedCuratorLogic player, 2];
	};

	case "Arsenal_BIS": {
		ctrlParent _control closeDisplay 0;
		['Open', true] spawn BIS_fnc_arsenal;
	};

	case "Arsenal_ACE": {
		if (HAS_ADDON("ace_arsenal")) then {
			ctrlParent _control closeDisplay 0;
			[player, player, true] call ace_arsenal_fnc_openBox;
		} else {
			"ace_arsenal addon not loaded" call BRM_FMK_RHEA_fnc_message;
		};
	};

	case "Camera": {
		ctrlParent _control closeDisplay 0;
		[] spawn BIS_fnc_camera;
	};

	case "Debug": {
		createDialog "BRM_FMK_RHEA_debug";
	};

	case "TFARSpecFix": {
		if (HAS_ADDON("tfar_core")) then {
			{
				if (alive _x && !(_x getVariable ["isDead", false]) && (_x getVariable ["TFAR_forceSpectator", false])) then {
					systemChat format ["TFARSpecFix: %1", _x];
					{
						if !(["IsSpectating"] call BIS_fnc_EGSpectator) then { // Local
							[player, false] call TFAR_fnc_forceSpectator;
						};
					} remoteExec ["call", _x];
				};
			} forEach allPlayers;
		} else {
			"tfar_core addon not loaded" call BRM_FMK_RHEA_fnc_message;
		};
	};

	case "MoveRespawn": {
		private _mapMarkers = allMapMarkers;
		if (_mapMarkers findIf { _x select [0, 7] == "respawn" } != -1) then {
			BRM_FMK_RHEA_moveRespawn_markersData = [];
			BRM_FMK_RHEA_moveRespawn_movedMarkers = [];

			// Show respawn markers
			{
				if (_x select [0, 7] == "respawn") then {
					private _markerData = [_x, markerAlpha _x, markerText _x, markerPos _x];
					if (markerType _x == "Empty") then {
						_markerData pushBack markerType _x;
						_x setMarkerTypeLocal "respawn_unknown";
					};
					BRM_FMK_RHEA_moveRespawn_markersData pushBack _markerData;
					_x setMarkerTextLocal _x;
					_x setMarkerAlphaLocal 1;
				};
			} forEach _mapMarkers;

			ctrlParent _control closeDisplay 2;
			openMap true;

			private _ctrlMap = findDisplay 12 displayCtrl 51;
			BRM_FMK_RHEA_moveRespawn_MouseButtonDownEH = _ctrlMap ctrlAddEventHandler ["MouseButtonDown", {
				params ["_ctrlMap", "_button", "_x", "_y", "_shift", "_ctrl", "_alt"];

				if (_button != 0) exitWith {};

				ctrlMapMouseOver _ctrlMap params [["_type", ""], "_marker"];

				if (_type == "marker" && { _marker select [0, 7] == "respawn" }) then {
					_ctrlMap ctrlMapCursor ["Track", "Move"];

					BRM_FMK_RHEA_moveRespawn = true;

					[{
						params ["_args", "_handle"];
						_args params ["_marker", "_ctrlMap"];

						if (isNil "BRM_FMK_RHEA_moveRespawn" || { !BRM_FMK_RHEA_moveRespawn }) exitWith {
							[BRM_FMK_RHEA_moveRespawn_movedMarkers, _marker, markerPos _marker] call BIS_fnc_setToPairs;
							[_handle] call CBA_fnc_removePerFrameHandler;
							_ctrlMap ctrlMapCursor ["Track", "Track"];
						};

						_marker setMarkerPosLocal (_ctrlMap ctrlMapScreenToWorld getMousePosition);
					}, 0, [_marker, _ctrlMap]] call CBA_fnc_addPerFrameHandler;
				};
			}];
			BRM_FMK_RHEA_moveRespawn_MouseButtonUpEH = _ctrlMap ctrlAddEventHandler ["MouseButtonUp", {
				params ["_ctrlMap", "_button", "_x", "_y", "_shift", "_ctrl", "_alt"];

				BRM_FMK_RHEA_moveRespawn = false;
			}];

			addMissionEventHandler ["Map", {
				params ["_opened", "_forced"];

				if (!_opened) then {
					BRM_FMK_RHEA_moveRespawn = false;

					// Restore all markers
					{
						_x params ["_marker", "_alpha", "_text", "_pos", "_type"];
						_marker setMarkerAlphaLocal _alpha;
						_marker setMarkerTextLocal _text;
						_marker setMarkerPosLocal _pos;
						if (!isNil "_type") then {
							_marker setMarkerTypeLocal _type;
						};
					} forEach BRM_FMK_RHEA_moveRespawn_markersData;

					// Apply marker movement globally
					{
						_x params ["_marker", "_pos"];
						_marker setMarkerPos _pos;
					} forEach BRM_FMK_RHEA_moveRespawn_movedMarkers;

					// Cleanup
					removeMissionEventHandler ["Map", _thisEventHandler];

					private _ctrlMap = findDisplay 12 displayCtrl 51;
					_ctrlMap ctrlRemoveEventHandler ["MouseButtonDown", BRM_FMK_RHEA_moveRespawn_MouseButtonDownEH];
					_ctrlMap ctrlRemoveEventHandler ["MouseButtonUp", BRM_FMK_RHEA_moveRespawn_MouseButtonUpEH];

					BRM_FMK_RHEA_moveRespawn = nil;
					BRM_FMK_RHEA_moveRespawn_MouseButtonUpEH = nil;
					BRM_FMK_RHEA_moveRespawn_MouseButtonDownEH = nil;
					BRM_FMK_RHEA_moveRespawn_movedMarkers = nil;
					BRM_FMK_RHEA_moveRespawn_markersData = nil;

					findDisplay getNumber (configFile >> "RscDisplayMission" >> "idd") createDisplay "BRM_FMK_RHEA_main";
				};
			}];
		} else {
			"No respawn markers" call BRM_FMK_RHEA_fnc_message;
		};
	};

	case "DisableSpawnProtection": {
		if (USES_BRMFMK_PLUGIN("spawn_protection")) then {
			{
				if (mission_spawn_protection_time > 0) then {
					mission_spawn_protection_time = 0;
				} else {
					["Spawn Protection is already disabled"] remoteExec ["BRM_FMK_RHEA_fnc_message", remoteExecutedOwner];
				};
			} remoteExec ["call", 2];
		} else {
			"spawn_protection plugin not loaded" call BRM_FMK_RHEA_fnc_message;
		};
	};

	case "DisableCommanderLock": {
		if (USES_BRMFMK_PLUGIN("commander_lock")) then {
			if !(co_lock_allSidesReady) then {
				BRM_FMK_Plugin_CommanderLock_lockedSides = createHashMap;
				publicVariable "BRM_FMK_Plugin_CommanderLock_lockedSides";

				co_lock_allSidesReady = true;
				publicVariable "co_lock_allSidesReady";

				["BRM_FMK_Plugin_CommanderLock_sideUnlocked", [nil]] call CBA_fnc_globalEvent;
				["Alert", ["Zeus declares that the mission is ready to begin!"]] remoteExec ["BIS_fnc_showNotification", 0];
			} else {
				"Commander Lock is already disabled" call BRM_FMK_RHEA_fnc_message;
			};
		} else {
			"commander_lock plugin not loaded" call BRM_FMK_RHEA_fnc_message;
		};
	};

	case "TimeLimit": {
		if (USES_BRMFMK_PLUGIN("time_limit")) then {
			0 spawn {
				(["Add to Time Limit", "Minutes to add:", "5"] call BRM_FMK_RHEA_fnc_inputDialog) params ["_status", "_text"];
				if (_status) then {
					private _seconds = (parseNumber _text) * 60;
					if (_seconds > 0) then {
						[_seconds] remoteExec ["BRM_FMK_TimeLimit_fnc_addTime", 2];
					} else {
						"Value must be greater than 0" call BRM_FMK_RHEA_fnc_message;
					};
				};
			};
		} else {
			"time_limit plugin not loaded" call BRM_FMK_RHEA_fnc_message;
		};
	};

	case "Conditions": {
		createDialog "BRM_FMK_RHEA_conditions";
	};

	case "EndMission": {
		0 spawn {
			private _options = if (isNil "BRM_FMK_fnc_callEnding") then {
				[
					["Everyone Won", "EveryoneWon", "Mission Completed"],
					["Everyone Lost", "EveryoneLost", "Mission Failed"],
					["Side Score", "SideScore", "Side with the best score wins"],
					["Group Score", "GroupScore", "Group with the best score wins"],
					["Player Score", "PlayerScore", "Player with the best score wins"]
				]
			} else {
				if (mission_game_mode == "coop") exitWith {
					// COOP
					[
						["Victory", endings_victory],
						["Defeat", endings_defeat]
					]
				};
				// (CO-)TVT
				[
					["Auto", endings_tvt_auto],
					["A Victory", endings_tvt_side_a_victory],
					["B Victory", endings_tvt_side_b_victory],
					["C Victory", endings_tvt_side_c_victory]
				]
			};

			(["End Mission", "Select the ending:", 0, _options] call BRM_FMK_RHEA_fnc_inputDialog) params ["_status", "_text", "_data", "_value"];
			if (_status) then {
				[_data] remoteExec [if (isNil "BRM_FMK_fnc_callEnding") then { "BIS_fnc_endMissionServer" } else { "BRM_FMK_fnc_callEnding" }, 2];
			};
		};
	};

	case "SelectAll": {
		private _ctrlPlayersList = ctrlParent _control displayCtrl 2100;
		for "_i" from 0 to lbSize _ctrlPlayersList - 1 do {
			_ctrlPlayersList lbSetSelected [_i, true];
		};
	};

	case "SelectAll";
	case "SelectPlayers";
	case "SelectAI";
	case "SelectWest";
	case "SelectEast";
	case "SelectGuer";
	case "SelectCiv": {
		private _filter = switch (_action) do {
			case "SelectAll": { {true} };
			case "SelectPlayers": { {isPlayer _this} };
			case "SelectAI": { {!isPlayer _this} };
			case "SelectWest": { {side _this == west} };
			case "SelectEast": { {side _this == east} };
			case "SelectGuer": { {side _this == independent} };
			case "SelectCiv": { {side _this == civilian} };
		};

		private _ctrlPlayersList = ctrlParent _control displayCtrl 2100;
		for "_i" from 0 to lbSize _ctrlPlayersList - 1 do {
			private _unit = missionNamespace getVariable (_ctrlPlayersList lbData _i);
			_ctrlPlayersList lbSetSelected [_i, _unit call _filter];
		};
	};

	case "DeleteDead": {
		0 spawn {
			(["Delete Dead", "Minimum player distance, in meters:", "300"] call BRM_FMK_RHEA_fnc_inputDialog) params ["_status", "_text"];
			if (_status) then {
				[parseNumber _text max 0] remoteExec ["BRM_FMK_RHEA_SERVER_fnc_deleteDead", 2];
			};
		};
	};

	case "Cleanup": {
		0 spawn {
			(["Cleanup", "Minimum player distance, in meters:", "300"] call BRM_FMK_RHEA_fnc_inputDialog) params ["_status", "_text"];
			if (_status) then {
				[parseNumber _text max 0] remoteExec ["BRM_FMK_RHEA_SERVER_fnc_cleanup", 2];
			};
		};
	};
};
