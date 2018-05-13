if !(isClass(configFile >> "CfgPatches" >> "task_force_radio")) exitWith {};

TF_same_sw_frequencies_for_side = true; publicVariable "TF_same_sw_frequencies_for_side";
TF_same_lr_frequencies_for_side = true; publicVariable "TF_same_lr_frequencies_for_side";
TF_no_auto_long_range_radio = true; publicVariable "TF_no_auto_long_range_radio";
TF_give_personal_radio_to_regular_soldier = false; publicVariable "TF_give_personal_radio_to_regular_soldier";
TF_give_microdagr_to_soldier = false; publicVariable "TF_give_microdagr_to_soldier";
TF_defaultWestBackpack = "TFAR_rt1523g_big_bwmod"; publicVariable "TF_defaultWestBackpack";

if (isServer) then {
    ["TFAR_giveLongRangeRadioToGroupLeaders", false, true, "server", true] call CBA_settings_fnc_set;
    ["TFAR_givePersonalRadioToRegularSoldier", false, true, "server", true] call CBA_settings_fnc_set;
    ["TFAR_giveMicroDagrToSoldier", false, true, "server", true] call CBA_settings_fnc_set;
    ["TFAR_SameSRFrequenciesForSide", true, true, "server", true] call CBA_settings_fnc_set;
    ["TFAR_SameLRFrequenciesForSide", true, true, "server", true] call CBA_settings_fnc_set;
    ["TFAR_fullDuplex", true, true, "server", true] call CBA_settings_fnc_set;
    ["TFAR_enableIntercom", true, true, "server", true] call CBA_settings_fnc_set;
    ["TFAR_objectInterceptionEnabled", true, true, "server", true] call CBA_settings_fnc_set;
    ["TFAR_spectatorCanHearEnemyUnits", true, true, "server", true] call CBA_settings_fnc_set;
    ["TFAR_spectatorCanHearFriendlies", true, true, "server", true] call CBA_settings_fnc_set;
};

["redoFrequencies", "OnRadiosReceived", BRM_FMK_TFAR_fnc_autoSetupRadios, player] call TFAR_fnc_addEventHandler;
