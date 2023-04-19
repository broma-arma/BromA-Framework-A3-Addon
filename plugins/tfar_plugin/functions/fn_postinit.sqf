#include "script_component.hpp"
if !(isClass (configFile >> "CfgPatches" >> "task_force_radio")) exitWith {};

["redoFrequencies", "OnRadiosReceived", FUNC(autoSetupRadios), player] call TFAR_fnc_addEventHandler;
