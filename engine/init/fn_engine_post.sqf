#include "script_component.hpp"
/*
================================================================================

NAME:
    BRM_fnc_engine_post

AUTHOR(s):
    Nife

DESCRIPTION:
    Is called every mission on post-init.

PARAMETERS:
    None.

USAGE:
    PostInit

RETURNS:
    Nothing.

================================================================================
*/

if (isNil "BRM_version" || !isNil QGVAR(post)) exitWith {};
GVAR(post) = true;

plugins_loaded = false;

if ([BRM_version, [0, 7, 5]] call FUNCMAIN(versionCompare) <= 0) then {
	ENGINE_plugins = +GVARMAIN(plugins);
	usedPlugins = +BRM_plugins;

	{
		params ["_old", "_new"];
		if (_new in usedPlugins) then {
			usedPlugins pushBack _old;
		};
	} forEach [
		["f_casualties_cap", "casualties_cap"],
		["f_evade_escape", "evade_escape"],
		["f_remove_body", "remove_body"]
	];
};

plugins_loaded = true;

if ([BRM_version, [0, 7, 5]] call FUNCMAIN(versionCompare) > 0) then {
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
					} forEach (getMissionLayerEntities _layerName select 1);
				};
			};
		} forEach [[WEST, "BLU"], [EAST, "OP"], [RESISTANCE, "IND"], [CIVILIAN, "CIV"]];
	};

	[] call FUNCMAIN(warnConflict);
	[] call FUNCMAIN(defineGroups);
	[] call FUNCMAIN(createPlayerVehicles);
	[] call FUNCMAIN(initPlayer);
	[] call FUNCMAIN(loadBriefing);

	private _postInitArgs = ["postInit", didJIP];
	{
		private _plugin = _x;
		{
			private _fnc = missionNamespace getVariable _x;
			if (!isNil "_fnc" && { _fnc isEqualType {} }) then {
				_postInitArgs call _fnc;
			} else {
				["[BromA Framework] Internal Error: Missing %1 plugin postInit function, %2.", _plugin, _x] call BIS_fnc_error;
			};
		} forEach getArray (configFile >> QGVARMAIN(Plugins) >> _plugin >> "postInit");
	} forEach BRM_plugins;

	// Prevents assignLoadout and assignCargo from executing before this
	pluginsLoaded = true;

	mission_init_server = scriptNull;
	if (isServer && fileExists "scripts\initServer.sqf") then {
		mission_init_server = [] spawn compile preprocessFileLineNumbers "scripts\initServer.sqf";
	};

	mission_init_player = scriptNull;
	if (hasInterface && fileExists "scripts\initPlayer.sqf") then {
		mission_init_player = [] spawn compile preprocessFileLineNumbers "scripts\initPlayer.sqf";
	};

	mission_init = scriptNull;
	if (fileExists "scripts\init.sqf") then {
		mission_init = [] spawn compile preprocessFileLineNumbers "scripts\init.sqf";
	};

	// TODO Force wait for init*.sqf to complete?
	//waitUntil { isNull mission_init_server && isNull mission_init_player && isNull mission_init };

	// Stops civilian randomized gear. =============================================
	{ if (side _x == civilian) then { _x setVariable ["BIS_enableRandomization", false] } } forEach allUnits;

	if (isServer && fileExists "settings\tasks.sqf") then {
		[] call compile preprocessFileLineNumbers "settings\tasks.sqf";

		[] spawn FUNCMAIN(checkTasks)
	};

	if (mission_AI_controller) then {
		[{ time > 5 }, {
			[QGVARMAIN(aiControllerInit)] call CBA_fnc_localEvent;
		}] call CBA_fnc_waitUntilAndExecute;
	};

	// Calculates the loading time and logs it. ====================================

	private _initTime = diag_tickTime - startTime;

	_initTime call FUNCMAIN(logPlugins);

	["LOCAL", "LOG", "=========================================================================================================="] call FUNCMAIN(doLog);
	["LOCAL", "F_LOG", format ["BROMA FRAMEWORK INITIALIZED SUCCESSFULLY IN %1 SECONDS.", _initTime]] call FUNCMAIN(doLog);
	["LOCAL", "LOG", "=========================================================================================================="] call FUNCMAIN(doLog);
};

if (hasInterface) then {
	private _channelSettings = [];
	for "_i" from 0 to 5 do {
		_channelSettings pushBack channelEnabled _i;
		_i enableChannel [true, false];
	};

	setCurrentChannel 1; // Side

	_channelSettings spawn {
		sleep 1;

		if ("commander_lock" in BRM_plugins) then {
			waitUntil { !isNil "locked_sides" && { !(side player in locked_sides) } };
		};
		{
			_forEachIndex enableChannel _x;
		} forEach _this;
	};
};

[] call EFUNC(OCAP,init); // TODO Remove and postInit it in plugin

enableSentences false; // Hacky shit to try to stop low FPS
