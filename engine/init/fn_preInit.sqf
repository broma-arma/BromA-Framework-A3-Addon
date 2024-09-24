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

_this call BRM_FMK_Engine_fnc_loadSettings;
_this call BRM_FMK_Engine_fnc_initVariables;

["LOCAL", "F_LOG", format ["STARTING MISSION '%1'", briefingName]] call BRM_FMK_fnc_doLog;
[] call BRM_FMK_Engine_fnc_loadContentCargo;

_this call BRM_FMK_Engine_fnc_loadPlugins;
