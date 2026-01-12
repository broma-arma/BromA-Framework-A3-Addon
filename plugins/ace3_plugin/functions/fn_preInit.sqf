// BRM_FMK_Plugin_ACE3_fnc_preInit
if !(isClass (configFile >> "CfgPatches" >> "ace_medical")) exitWith {};

if (mission_KAT_enabled) then {
	BRM_FMK_Plugin_ACE3_CBA_SettingsInitialized = false;
	["CBA_SettingsInitialized", {
		[] call BRM_FMK_Plugin_ACE3_fnc_updateKatFAKs;
		BRM_FMK_Plugin_ACE3_CBA_SettingsInitialized = true;
	}] call CBA_fnc_addEventHandler;
};
