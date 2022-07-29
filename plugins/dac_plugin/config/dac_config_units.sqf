if ([BRM_version, [0, 7, 5]] call BRM_FMK_fnc_versionCompare <= 0) exitWith {
	DAC_fConfigUnits = compile preprocessFileLineNumbers "dac\dac_config_units.sqf";
	_this call DAC_fConfigUnits
};

#include "\broma_framework\loadouts\includes\vehicles-index.sqf"

params ["_index"];

private ["_Unit_Pool_S", "_Unit_Pool_V", "_Unit_Pool_T", "_Unit_Pool_A"];

switch (_index) do {
	case 0: { // OPFOR
		_Unit_Pool_S = [EAST] call BRM_FMK_fnc_getUnitsArray;

		private _OVehicles = [[EAST, "FACTION"] call BRM_FMK_fnc_getSideInfo, "VEHICLES"] call BRM_FMK_fnc_getLoadoutProperty;
		_Unit_Pool_V = [_OVehicles, [LIGHT_VEHICLES, TRANSPORT_TRUCKS]] call BRM_FMK_fnc_appendIndices;
		_Unit_Pool_T = [_OVehicles, [MEDIUM_VEHICLES, HEAVY_VEHICLES]] call BRM_FMK_fnc_appendIndices;
		_Unit_Pool_A = [_OVehicles, [ATTACK_HELOS, TRANSPORT_HELOS]] call BRM_FMK_fnc_appendIndices;
	};
	case 1: { // BLUFOR
		_Unit_Pool_S = [WEST] call BRM_FMK_fnc_getUnitsArray;

		private _BVehicles = [[WEST, "FACTION"] call BRM_FMK_fnc_getSideInfo, "VEHICLES"] call BRM_FMK_fnc_getLoadoutProperty;
		_Unit_Pool_V = [_BVehicles, [LIGHT_VEHICLES, TRANSPORT_TRUCKS]] call BRM_FMK_fnc_appendIndices;
		_Unit_Pool_T = [_BVehicles, [MEDIUM_VEHICLES, HEAVY_VEHICLES]] call BRM_FMK_fnc_appendIndices;
		_Unit_Pool_A = [_BVehicles, [ATTACK_HELOS, TRANSPORT_HELOS]] call BRM_FMK_fnc_appendIndices;
	};
	case 2: { // INDEPENDENT
		_Unit_Pool_S = [RESISTANCE] call BRM_FMK_fnc_getUnitsArray;

		private _IVehicles = [[RESISTANCE, "FACTION"] call BRM_FMK_fnc_getSideInfo, "VEHICLES"] call BRM_FMK_fnc_getLoadoutProperty;
		_Unit_Pool_V = [_IVehicles, [LIGHT_VEHICLES, TRANSPORT_TRUCKS]] call BRM_FMK_fnc_appendIndices;
		_Unit_Pool_T = [_IVehicles, [MEDIUM_VEHICLES, HEAVY_VEHICLES]] call BRM_FMK_fnc_appendIndices;
		_Unit_Pool_A = [_IVehicles, [ATTACK_HELOS, TRANSPORT_HELOS]] call BRM_FMK_fnc_appendIndices;
	};
	case 3: { // CIVILIAN
		_Unit_Pool_S = ["C_man_1", "C_man_1", "C_man_1", "C_man_polo_1_F", "C_man_polo_2_F", "C_man_polo_3_F", "C_man_polo_4_F", "C_man_polo_5_F", "C_man_polo_6_F", "C_man_1_1_F", "C_man_1_2_F", "C_man_1_3_F"];
		_Unit_Pool_V = ["C_Van_01_box_F", "C_Van_01_transport_F", "C_Offroad_01_F", "C_Hatchback_01_sport_F", "C_Hatchback_01_F"];
		_Unit_Pool_T = ["C_Van_01_box_F", "C_Van_01_transport_F", "C_Offroad_01_F", "C_Hatchback_01_sport_F", "C_Hatchback_01_F"];
		_Unit_Pool_A = [];
	};
};

if (isNil "BRM_FMK_DAC_cfgUnits") then {
	BRM_FMK_DAC_cfgUnits = if (fileExists "dac\dac_config_units.sqf") then { compile preprocessFileLineNumbers "dac\dac_config_units.sqf" } else { {} };
};
call BRM_FMK_DAC_cfgUnits;

if (DAC_Basic_Value != 5 && (isNil "_Unit_Pool_S" || isNil "_Unit_Pool_V" || isNil "_Unit_Pool_T" || isNil "_Unit_Pool_A")) exitWith {
	DAC_Basic_Value = 5; publicVariable "DAC_Basic_Value",
	systemChat "Error: DAC_Config_Units > No valid config number";
};

if (count _this == 2) exitWith {
	[_Unit_Pool_S, _Unit_Pool_V, _Unit_Pool_T, _Unit_Pool_A]
};

_Unit_Pool_V + _Unit_Pool_T + _Unit_Pool_A
