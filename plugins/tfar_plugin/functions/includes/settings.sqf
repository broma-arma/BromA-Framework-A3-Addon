if (isNil "tf_same_sw_frequencies_for_side") then { tf_same_sw_frequencies_for_side = true };
if (isNil "tf_same_lr_frequencies_for_side") then { tf_same_lr_frequencies_for_side = true };
if (isNil "tf_no_auto_long_range_radio") then { tf_no_auto_long_range_radio = true };
if (isNil "TF_give_personal_radio_to_regular_soldier") then { TF_give_personal_radio_to_regular_soldier = false };
if (isNil "TF_give_microdagr_to_soldier") then { TF_give_microdagr_to_soldier = false };

["tf_same_sw_frequencies_for_side", tf_same_sw_frequencies_for_side, true] call CBA_settings_fnc_set;
["tf_same_lr_frequencies_for_side", tf_same_lr_frequencies_for_side, true] call CBA_settings_fnc_set;
["tf_no_auto_long_range_radio", tf_no_auto_long_range_radio, true] call CBA_settings_fnc_set;
["tf_give_personal_radio_to_regular_soldier", TF_give_personal_radio_to_regular_soldier, true] call CBA_settings_fnc_set;
["tf_give_microdagr_to_soldier", TF_give_microdagr_to_soldier, true] call CBA_settings_fnc_set;