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

BRM_FMK_Engine_compatVersion = -1;
if (isClass (missionConfigFile >> "CfgFunctions" >> "BRM" >> "init" >> "engine_pre") && fileExists "framework\local_version.txt") then {
	BRM_FMK_Engine_missionVersion = call compile preprocessFile "framework\local_version.txt"; // "075", "0745", "074", "073", "07"
	BRM_FMK_Engine_compatVersion = 0;
};
if (isArray (missionConfigFile >> "BRM_FMK" >> "missionVersion")) then {
	BRM_FMK_Engine_missionVersion = getArray (missionConfigFile >> "BRM_FMK" >> "missionVersion") joinString ".";
	BRM_FMK_Engine_compatVersion = 1;
};

if (isNil "BRM_FMK_Engine_missionVersion") exitWith {};

BRM_FMK_Engine_preInitTime = diag_tickTime;

_this call BRM_FMK_Engine_fnc_initVariables;
_this call BRM_FMK_Engine_fnc_loadPlugins;

BRM_FMK_Engine_preInitTime = diag_tickTime - BRM_FMK_Engine_preInitTime;
