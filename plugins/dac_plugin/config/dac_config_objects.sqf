if ([BRM_version, [0, 7, 5]] call BRM_FMK_fnc_versionCompare <= 0) exitWith {
	DAC_fConfigObj = compile preprocessFileLineNumbers "dac\dac_config_objects.sqf";
	_this call DAC_fConfigObj
};

params ["_index"];

private ["_Object_Pool"];

switch (_index) do {
	case 0:	{
		_Object_Pool = [
			[12, 1],
			["LOGIC", 1, 0, 0, 0, 0, ""]
		];
	};
	case 1:	{
		_Object_Pool = [
			[15, 1],
			["Box_NATO_Ammo_F", 2, 0, 0, 0, 0, ""],
			["Box_NATO_Wps_F", 1, 0, 0, 0, 0, ""],
			["Box_NATO_Grenades_F", 1, 0, 0, 0, 0, ""],
			["Box_NATO_AmmoOrd_F", 1, 0, 0, 0, 0, ""],
			["Box_NATO_WpsSpecial_F", 2, 0, 0, 0, 0, ""],
			["Box_NATO_Support_F", 2, 0, 0, 0, 0, ""]
		];
	};
	case 2:	{
		_Object_Pool = [
			[15, 1],
			["DAC_Small_Stone_01_F", 3, 0, 0, 0, 0, "", [1, "ColorBlack"]],
			["DAC_t_FicusB2s_F", 1, 0, 0, 0, 0, "", [0, "ColorBlue"]],
			["DAC_t_FicusB1s_F", 1, 0, 0, 0, 0, "", [0, "ColorBlue"]],
			["DAC_t_PopulusN3s_F", 1, 0, 0, 0, 0, "", [0, "ColorBlue"]]
		];
	};
	case 3:	{
		_Object_Pool = [
			[15, 1],
			["DAC_b_FicusC2s_F", 1, 0, 0, 0, 0, "", [0, "ColorGreen"]],
			["DAC_b_FicusC1s_F", 1, 0, 0, 0, 0, "", [0, "ColorGreen"]]
		];
	};
	case 4:	{
		_Object_Pool = [
			[15, 1],
			["DAC_t_PinusS2s_F", 1, 0, 0.1, 0, 0, "", [0, "ColorGreen"]],
			["DAC_t_PinusS2s_b_F", 1, 0, 0.1, 0, 0, "", [0, "ColorGreen"]],
			["DAC_t_PinusS1s_F", 1, 0, 0.1, 0, 0, "", [0, "ColorGreen"]],
			["DAC_t_PinusP3s_F", 1, 0, 0.1, 0, 0, "", [0, "ColorGreen"]]
		];
	};
	case 5: {
		_Object_Pool = [
			[15, 1],
			["RHS_M2StaticMG_WD", 1, 0, 0.0, 0, 0, "", [0, "ColorGreen"]],
			["RHS_MK19_TriPod_WD", 1, 0, 0.0, 0, 0, "", [0, "ColorGreen"]]
		];
	};
};

if (isNil "BRM_FMK_DAC_cfgObjects") then {
	BRM_FMK_DAC_cfgObjects = if (fileExists "dac\dac_config_objects.sqf") then { compile preprocessFileLineNumbers "dac\dac_config_objects.sqf" } else { {} };
};
call BRM_FMK_DAC_cfgObjects;

if (DAC_Basic_Value != 5 && isNil "_Object_Pool") exitWith {
	DAC_Basic_Value = 5; publicVariable "DAC_Basic_Value";
	systemChat "Error: DAC_Config_Objects > No valid config number";
};

_Object_Pool
