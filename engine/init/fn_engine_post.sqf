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

if (isNil "BRM_version" || !isNil "BRM_FMK_post") exitWith {};
BRM_FMK_post = true;

plugins_loaded = false;

if ([BRM_version, [0, 7, 5]] call BRM_FMK_fnc_versionCompare <= 0) then {
	ENGINE_plugins = +BRM_FMK_plugins;
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
} else {
	private _postInitArgs = ["postInit", didJIP];
	{
		private _plugin = _x;
		{
			if (!isNil _x) then {
				_postInitArgs call (missionNamespace getVariable _x);
			} else {
				["[BromA Framework] Internal Error: Unknown ""%2"" plugin postInit function, %2.", _plugin, _x] call BIS_fnc_error;
			};
		} forEach getArray (configFile >> "BRM_FMK_Plugins" >> _plugin >> "postInit");
	} forEach BRM_plugins;
};

plugins_loaded = true;

if ([BRM_version, [0, 7, 5]] call BRM_FMK_fnc_versionCompare > 0) then {
	[] call BRM_FMK_fnc_logPlugins;
	[] call BRM_FMK_fnc_warnConflict;
	[] call BRM_FMK_fnc_defineGroups;
	[] call BRM_FMK_fnc_createPlayerVehicles;
	[] call BRM_FMK_fnc_readExtraction;
	[] call BRM_FMK_fnc_initPlayer;
	[] call BRM_FMK_fnc_loadBriefing;

	//pluginsLoaded = true; // TODO Why was this here?

	if (isServer) then { mission_init_server = [] execVM "mission\custom-scripts\initServer.sqf" };

	if (hasInterface) then { mission_init_player = [] execVM "mission\custom-scripts\initPlayer.sqf" };

	mission_init = [] execVM "mission\custom-scripts\init.sqf";

	// Stops civilian randomized gear. =============================================
	{ if (side _x == civilian) then { _x setVariable ["BIS_enableRandomization", false] } } forEach allUnits;

	// Calculates the loading time and logs it. ====================================

	framework_init_time = (diag_tickTime - startTime);

	["LOCAL", "LOG", "=========================================================================================================="] call BRM_FMK_fnc_doLog;
	["LOCAL", "F_LOG", format ["BROMA FRAMEWORK INITIALIZED SUCCESSFULLY IN %1 SECONDS.", framework_init_time]] call BRM_FMK_fnc_doLog;
	["LOCAL", "LOG", "=========================================================================================================="] call BRM_FMK_fnc_doLog;
};

[] call BRM_FMK_OCAP_fnc_init;

enableSentences false; // Hacky shit to try to stop low FPS
