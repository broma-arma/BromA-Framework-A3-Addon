/*
================================================================================

NAME:
    BRM_FMK_fnc_endLoading

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
    [] call BRM_FMK_fnc_endLoading

RETURNS:
    Nothing.

================================================================================
*/

pluginsLoaded = true; // Backward compatibility (Used by assignLoadout, assignCargo, and dac_config_creator)

private _missionScripts = [];

if (isServer) then {
	if (BRM_FMK_Engine_compatVersion == 0) then {
		_missionScripts pushBack ([] execVM "mission\custom-scripts\initServer.sqf");
		mission_settings = scriptNull; // Backward compatibility (tasks.sqf waits for `scriptDone mission_settings`)
		_missionScripts pushBack ([] execVM "mission\objectives\tasks.sqf");

		[{ missionNamespace getVariable ["BRM_FMK_Engine_compat0_checkTasks", false] }, {
			BRM_FMK_Engine_checkTasksPFH = [{ _this call BRM_FMK_Engine_fnc_checkTasks; }, 1] call CBA_fnc_addPerFrameHandler;
		}] call CBA_fnc_waitUntilAndExecute;
	} else {
		_missionScripts pushBack ([] execVM "mission\scripts\initServer.sqf");
		[] call compile preprocessFileLineNumbers "mission\objectives\tasks.sqf";
		BRM_FMK_Engine_checkTasksPFH = [{ _this call BRM_FMK_Engine_fnc_checkTasks; }, 1] call CBA_fnc_addPerFrameHandler;
	};
};

if (mission_AI_controller) then {
	if (BRM_FMK_Engine_compatVersion == 0) then {
		_missionScripts pushBack ([] execVM "mission\objectives\mission_AI.sqf");
	} else {
		if ("dac_plugin" in BRM_FMK_Engine_activePlugins) then {
			[{ !isNil "DAC_InCreate" || DAC_Basic_Value > 0 }, {
				[] execVM "mission\objectives\ai.sqf";
			}] call CBA_fnc_waitUntilAndExecute;
		} else {
			[] execVM "mission\objectives\ai.sqf";
		};
	};
};

if (hasInterface) then {
	if (BRM_FMK_Engine_compatVersion == 0) then {
		_missionScripts pushBack ([] execVM "mission\custom-scripts\initPlayer.sqf");
	} else {
		_missionScripts pushBack ([] execVM "mission\scripts\initPlayer.sqf");
	};
};

if (BRM_FMK_Engine_compatVersion == 0) then {
	_missionScripts pushBack ([] execVM "mission\custom-scripts\init.sqf");
} else {
	_missionScripts pushBack ([] execVM "mission\scripts\init.sqf");
};

{ if (side _x == civilian) then { _x setVariable ["BIS_enableRandomization", false] } } forEach allUnits;

BRM_FMK_Engine_postInitTime = diag_tickTime - BRM_FMK_Engine_postInitTime;
BRM_FMK_Engine_initTime = BRM_FMK_Engine_preInitTime + BRM_FMK_Engine_postInitTime;
["LOCAL", "F_LOG", format ["%1 initialized in %2 seconds (Pre: %3, Post: %4)", getText (configFile >> "CfgPatches" >> "BRM_FRAMEWORK" >> "versionDesc"), BRM_FMK_Engine_initTime, BRM_FMK_Engine_preInitTime, BRM_FMK_Engine_postInitTime]] call BRM_FMK_fnc_doLog;

["BRM_FMK_Engine_initialized"] call CBA_fnc_localEvent;
BRM_FMK_Engine_initialized = true;

[{ _this findif { !scriptDone _x } == -1 }, {
	["BRM_FMK_initialized"] call CBA_fnc_localEvent;
	BRM_FMK_initialized = true;
	["LOCAL", "F_LOG", format ["MISSION SCRIPTS INITIALIZED @ %1", time]] call BRM_FMK_fnc_doLog;
}, _missionScripts] call CBA_fnc_waitUntilAndExecute;
