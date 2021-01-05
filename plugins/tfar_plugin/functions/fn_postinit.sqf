#include "component.hpp"

if !(isClass (configFile >> "CfgPatches" >> "task_force_radio")) exitWith {};

["redoFrequencies", "OnRadiosReceived", BRM_FMK_TFAR_fnc_autoSetupRadios, player] call TFAR_fnc_addEventHandler;
