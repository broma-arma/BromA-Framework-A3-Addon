if ([BRM_version, [0, 7, 5]] call BRM_FMK_fnc_versionCompare <= 0) exitWith {
	DAC_fConfigArti = compile preprocessFileLineNumbers "dac\dac_config_arti.sqf";
	_this call DAC_fConfigArti
};

params ["_index"];

private ["_set0", "_set1", "_set2", "_set3", "_set4", "_set5", "_set6", "_set7", "_set8", "_set9", "_set10"];

if (_index == 0) exitwith { [] };

switch (_index) do {
	case 1: {
		_set0  = [20, 2, 0, 60];
		_set1  = [2, 0.1, 10, [], 3, 30];
		_set2  = [100, 10, 50, 500, 4, 1, 0];
		_set3  = [["O_Mortar_01_F", ["M_PG_AT"]]];
		_set4  = [5, 5, 1];
		_set5  = [10, 30, 1];
		_set6  = [10, 30, 1];
		_set7  = [0.1, 0.5, 1];
		_set8  = [];
		_set9  = [];
		_set10 = 15000;
	};
	case 2: {
		_set0  = [20, 2, 0, 60];
		_set1  = [2, 0.1, 10, [], 3, 30];
		_set2  = [100, 10, 50, 500, 4, 1, 0];
		_set3  = [["B_Mortar_01_F", ["M_PG_AT"]]];
		_set4  = [5, 5, 1];
		_set5  = [10, 30, 1];
		_set6  = [10, 30, 1];
		_set7  = [0.1, 0.5, 1];
		_set8  = [];
		_set9  = [];
		_set10 = 15000;
	};
	case 3: {
		_set0  = [0, 0, 0, 0];
		_set1  = [0, 0, 0, [], 1, 5];
		_set2  = [100, 0, 0, 500, 4, 1, 1];
		_set3  = [["B_Mortar_01_F", ["M_Mo_82mm_AT_LG"]], ["B_MBT_01_arty_F", ["R_60mm_HE"]]];
		_set4  = [2, 5, 0];
		_set5  = [5, 10, 1];
		_set6  = [5, 10, 1];
		_set7  = [0.1, 1, 1];
		_set8  = [];
		_set9  = [];
		_set10 = 1500;
	};
};

if (isNil "BRM_FMK_DAC_cfgArti") then {
	BRM_FMK_DAC_cfgArti = if (fileExists "dac\dac_config_arti.sqf") then { compile preprocessFileLineNumbers "dac\dac_config_arti.sqf" } else { {} };
};
call BRM_FMK_DAC_cfgArti;

if (DAC_Basic_Value != 5 && (isNil "_set0" || isNil "_set1" || isNil "_set2" || isNil "_set3" || isNil "_set4" || isNil "_set5" || isNil "_set6" || isNil "_set7" || isNil "_set8" || isNil "_set9" || isNil "_set10")) exitWith {
	DAC_Basic_Value = 5; publicVariable "DAC_Basic_Value";
	systemChat "Error: DAC_Config_Arti > No valid config number";
};

[_set0, _set1, _set2, _set3, _set4, _set5, _set6, _set7, _set8, _set9, _set10]
