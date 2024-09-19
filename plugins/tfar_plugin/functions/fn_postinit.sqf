if !(isClass (configFile >> "CfgPatches" >> "task_force_radio")) exitWith {};

["redoFrequencies", "OnRadiosReceived", { _this call BRM_FMK_Plugin_TFAR_fnc_autoSetupRadios; }, player] call TFAR_fnc_addEventHandler;
