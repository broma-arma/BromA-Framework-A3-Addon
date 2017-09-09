
if !(isClass(configFile>>"CfgPatches">>"task_force_radio")) exitWith {};
#include "includes\settings.sqf"

[] call BRM_FMK_TFAR_fnc_autoSetupRadios;