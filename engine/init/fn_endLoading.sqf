/*
================================================================================

NAME:
    BRM_fnc_endLoading

AUTHOR(s):
    Nife

DESCRIPTION:
    Marks the ending of the loading of the Framework and writes the
    initialization time to the local log.
    Also calls surrogate initializations for those who are used to the old style
    of initializing scripts and disables randomization in civilians.

PARAMETERS:
    None.

USAGE:
    [] call BRM_fnc_endLoading

RETURNS:
    Nothing.

================================================================================
*/

// Calls surrogate initServer.sqf to the server only. ==========================

if (isServer) then { mission_init_server = [] execVM "mission\custom-scripts\initServer.sqf" };

// Calls surrogate initPlayer.sqf to players only. =============================

if (hasInterface) then { mission_init_player = [] execVM "mission\custom-scripts\initPlayer.sqf" };

// Calls surrogate init.sqf to both. ===========================================

mission_init = [] execVM "mission\custom-scripts\init.sqf";

// Stops civilian randomized gear. =============================================

{ if (side _x == civilian) then { _x setVariable ["BIS_enableRandomization", false] } } forEach allUnits;

// Calculates the loading time and logs it. ====================================

BRM_FMK_Engine_initTime = diag_tickTime - BRM_FMK_Engine_initTime;
["LOCAL", "LOG", "=========================================================================================================="] call BRM_FMK_fnc_doLog;
["LOCAL", "F_LOG", format ["BROMA FRAMEWORK INITIALIZED SUCCESSFULLY IN %1 SECONDS.", BRM_FMK_Engine_initTime]] call BRM_FMK_fnc_doLog;
["LOCAL", "LOG", "=========================================================================================================="] call BRM_FMK_fnc_doLog;

["BRM_FMK_Engine_initialized"] call CBA_fnc_localEvent;

[{ _missionScripts findif { !scriptDone _x } == -1 }, {
	["BRM_FMK_initialized"] call CBA_fnc_localEvent;
	BRM_FMK_initialized = true;
	pluginsLoaded = true; // Backwards compatibility (Used by assignLoadout, assignCargo, and dac_config_creator in missions)
}] call CBA_fnc_waitUntilAndExecute;
