/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_loadScripts

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Loads mission scripts.

PARAMETERS:
    None.

USAGE:
    [] call BRM_FMK_Engine_fnc_loadScripts

RETURNS:
    Loaded script handles. (ARRAY)

================================================================================
*/

private _scripts = [];

if (BRM_FMK_Engine_compatVersion == 0) then {
	if (isServer) then {
		_scripts pushBack ([] execVM "mission\custom-scripts\initServer.sqf");
		mission_settings = scriptNull; // Backward compatibility (tasks.sqf waits for `scriptDone mission_settings`)
		_scripts pushBack ([] execVM "mission\objectives\tasks.sqf");

		[{ missionNamespace getVariable ["BRM_FMK_Engine_compat0_checkTasks", false] }, {
			BRM_FMK_Engine_checkTasksPFH = [{ _this call BRM_FMK_Engine_fnc_checkTasks; }, 1] call CBA_fnc_addPerFrameHandler;
		}] call CBA_fnc_waitUntilAndExecute;
	};

	if (mission_AI_controller) then {
		_scripts pushBack ([] execVM "mission\objectives\mission_AI.sqf");
	};

	if (hasInterface) then {
		_scripts pushBack ([] execVM "mission\custom-scripts\initPlayer.sqf");

		player addEventHandler ["Respawn", { _this call BRM_fnc_onPlayerRespawn }];
	};

	_scripts pushBack ([] execVM "mission\custom-scripts\init.sqf");
} else {
	private _fnc_loadInitFile = {
		params ["_file", "_name"];

		if (!fileExists _file) exitWith {};

		private _script = [] call compile preprocessFileLineNumbers _file;
		if !(_x isEqualType {}) exitWith {
			["%1 doesn't return code. Make sure there is nothing after the `}` in %2", _name, _file] call BIS_fnc_error;
		};

		_scripts pushBack _script;
	};

	["mission\scripts\init.sqf", "init"] call _fnc_loadInitFile;

	if (isServer) then {
		["mission\scripts\initServer.sqf", "initServer"] call _fnc_loadInitFile;
		if (fileExists "mission\objectives\tasks.sqf") then {
			[] call compile preprocessFileLineNumbers "mission\objectives\tasks.sqf";
		};
		BRM_FMK_Engine_checkTasksPFH = [{ _this call BRM_FMK_Engine_fnc_checkTasks; }, 1] call CBA_fnc_addPerFrameHandler;
	};

	if (hasInterface) then {
		["mission\scripts\initPlayer.sqf", "initPlayer"] call _fnc_loadInitFile;

		if (fileExists "mission\scripts\initPlayerServer.sqf") then {
			[[player, didJIP], "mission\scripts\initPlayerServer.sqf"] remoteExec ["execVM", 2];
		};

		if (fileExists "mission\scripts\onPlayerKilled.sqf") then {
			player addEventHandler ["Killed", compile preprocessFileLineNumbers "mission\scripts\onPlayerKilled.sqf"];
		};

		if (fileExists "mission\scripts\onPlayerRespawn.sqf") then {
			player addEventHandler ["Respawn", compile preprocessFileLineNumbers "mission\scripts\onPlayerRespawn.sqf"];
		};
	};

	if (mission_AI_controller && fileExists "mission\objectives\ai.sqf") then {
		if ("dac_plugin" in BRM_FMK_Engine_activePlugins) then {
			[{ !isNil "DAC_InCreate" || DAC_Basic_Value > 0 }, {
				[] execVM "mission\objectives\ai.sqf";
			}] call CBA_fnc_waitUntilAndExecute;
		} else {
			[] execVM "mission\objectives\ai.sqf";
		};
	};
};

_scripts
