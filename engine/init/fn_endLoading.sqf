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

private _missionScripts = [];

if (isServer) then {
	_missionScripts pushBack ([] execVM "mission\custom-scripts\initServer.sqf");
	mission_settings = scriptNull; // tasks.sqf waits for `scriptDone mission_settings`
	_missionScripts pushBack ([] execVM "mission\objectives\tasks.sqf");
};

if (mission_AI_controller) then {
	_missionScripts pushBack ([] execVM "mission\objectives\mission_AI.sqf");
};

if (hasInterface) then {
	_missionScripts pushBack ([] execVM "mission\custom-scripts\initPlayer.sqf");
};

_missionScripts pushBack ([] execVM "mission\custom-scripts\init.sqf");

{ if (side _x == civilian) then { _x setVariable ["BIS_enableRandomization", false] } } forEach allUnits;

BRM_FMK_Engine_initTime = diag_tickTime - BRM_FMK_Engine_initTime;
["LOCAL", "LOG", "=========================================================================================================="] call BRM_FMK_fnc_doLog;
["LOCAL", "F_LOG", format ["BROMA FRAMEWORK INITIALIZED SUCCESSFULLY IN %1 SECONDS.", BRM_FMK_Engine_initTime]] call BRM_FMK_fnc_doLog;
["LOCAL", "LOG", "=========================================================================================================="] call BRM_FMK_fnc_doLog;

["BRM_FMK_Engine_initialized"] call CBA_fnc_localEvent;

[{ _this findif { !scriptDone _x } == -1 }, {
	["BRM_FMK_initialized"] call CBA_fnc_localEvent;
	BRM_FMK_initialized = true;
	pluginsLoaded = true; // Backward compatibility (Used by assignLoadout, assignCargo, and dac_config_creator in missions)
}, _missionScripts] call CBA_fnc_waitUntilAndExecute;
