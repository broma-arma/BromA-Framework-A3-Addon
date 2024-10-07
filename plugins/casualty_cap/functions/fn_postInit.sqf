if !(isMultiplayer && isServer) exitWith {};

private _casCap = ["p_cas_cap", -1] call BIS_fnc_getParamValue; // -1="Disabled", 80="80%", 90="90%", 95="95%", 100="100%"
if (_casCap <= 0) exitWith {};

private _bluforGroups = ["blu_0_0", "blu_1_0", "blu_1_1", "blu_1_2", "blu_2_0", "blu_2_1", "blu_2_2", "blu_3_0", "blu_3_1", "blu_3_2", "blu_4_0", "blu_4_1", "blu_4_2"];
private _opforGroups = ["op_0_0", "op_1_0", "op_1_1", "op_1_2", "op_2_0", "op_2_1", "op_2_2", "op_3_0", "op_3_1", "op_3_2", "op_4_0", "op_4_1", "op_4_2"];
private _indforGroups = ["ind_0_0", "ind_1_0", "ind_1_1", "ind_1_2", "ind_2_0", "ind_2_1", "ind_2_2", "ind_3_0", "ind_3_1", "ind_3_2", "ind_4_0", "ind_4_1", "ind_4_2"];
if (BRM_FMK_Engine_compatVersion == 0) then {
	private _fnc_convert = {
		private _value = trim _this; //"[blu_0_0, blu_1_0, blu_1_1, blu_1_2, blu_2_0, blu_2_1, blu_2_2, blu_3_0, blu_3_1, blu_3_2, blu_4_0, blu_4_1, blu_4_2]"
		_value = _value select [1, count _value - 2];
		_value splitString "," apply { trim _x }
	};
	if (!isNil "casualty_group_BLU") then { _bluforGroups = casualty_group_BLU call _fnc_convert; };
	if (!isNil "casualty_group_OP") then { _opforGroups = casualty_group_OP call _fnc_convert; };
	if (!isNil "casualty_group_IND") then { _indforGroups = casualty_group_IND call _fnc_convert; };
} else {
	if (fileExists "mission\settings\plugins\casualty_cap.sqf") then {
		call compile preprocessFileLineNumbers "mission\settings\plugins\casualty_cap.sqf";
	};
};
BRM_FMK_Plugin_CasualtyCap_bluforGroups = _bluforGroups;
BRM_FMK_Plugin_CasualtyCap_opforGroups = _opforGroups;
BRM_FMK_Plugin_CasualtyCap_indforGroups = _indforGroups;

[{
	params ["_casCap"];

	private _percent = _casCap / 100;
	if (mission_game_mode == "tvt") then {
		private _callback = { [endings_tvt_auto] call BRM_FMK_fnc_endMission; };
		[side_a_side, _percent, _callback] call BRM_FMK_fnc_checkCasualties;
		[side_b_side, _percent, _callback] call BRM_FMK_fnc_checkCasualties;

		if (mission_enable_side_c) then {
			[side_c_side, _percent, _callback] call BRM_FMK_fnc_checkCasualties;
		};
	} else {
		[side_a_side, _percent, { [endings_defeat] call BRM_FMK_fnc_endMission; }] call BRM_FMK_fnc_checkCasualties
	};
}, [_casCap], 5] call CBA_fnc_waitAndExecute;
