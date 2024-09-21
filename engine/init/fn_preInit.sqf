/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_preInit

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Addon framework pre-init.

PARAMETERS:
    None.

USAGE:
    [] call BRM_FMK_Engine_fnc_preInit

RETURNS:
    Nothing.

================================================================================
*/

if (!isClass (missionConfigFile >> "CfgFunctions" >> "BRM" >> "init" >> "engine_pre")) exitWith {};

BRM_FMK_Engine_initTime = diag_tickTime;

BRM_FMK_missionVersion = call compile preprocessFile "framework\local_version.txt"; // "075", "0745", "074", "073", "07"

// Disable mission's deprecated pre/postInit functions
private _emptyFinalCode = compileFinal "";
{
	missionNamespace setVariable [_x, _emptyFinalCode];
} forEach [
	// PreInit
	"BRM_fnc_loadSettings",
	"BRM_fnc_initVariables",
	"BRM_fnc_engine_pre",
	// PostInit
	"BRM_fnc_logPlugins",
	"BRM_fnc_warnConflict",
	"BRM_fnc_defineGroups",
	"BRM_fnc_createPlayerVehicles",
	"BRM_fnc_readExtraction",
	"BRM_fnc_initPlayer",
	"BRM_fnc_loadBriefing",
	"BRM_endLoading_fnc_endLoading"
];

_this call BRM_FMK_Engine_fnc_loadSettings;
_this call BRM_FMK_Engine_fnc_initVariables;

["LOCAL", "F_LOG", format ["STARTING MISSION '%1'", briefingName]] call BRM_FMK_fnc_doLog;
[] call BRM_FMK_Engine_fnc_loadContentCargo;

// Plugins preInit
{
	private _configName = configName _x;
	private _cfgPlugin = configFile >> "BRM_FMK" >> "Plugins" >> _configName;
	if (isClass _cfgPlugin) then {
		private _fnc = missionNamespace getVariable format ["%1_fnc_preInit", [_cfgPlugin, "tag", format ["BRM_FMK_Plugin_%1", _configName]] call BIS_fnc_returnConfigEntry];
		if (!isNil "_fnc") then {
			_this call _fnc;
		};
	};
} forEach ("true" configClasses (missionConfigFile >> "CfgPlugins"));