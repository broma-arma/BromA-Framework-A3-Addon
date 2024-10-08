params ["_type"];

private _params = ["_Object_Pool"];
private _params;

switch (_type) do {
	case 0:	{ // use this config if you want to create positions only
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

if (fileExists "mission\settings\dac\dac_config_objects.sqf") then {
	[_type] call compile preprocessFileLineNumbers "mission\settings\dac\dac_config_objects.sqf";
};

if (_params findIf { isNil _x } != -1) exitWith {
	if (DAC_Basic_Value != 5) then {
		DAC_Basic_Value = 5; publicVariable "DAC_Basic_Value";
		hintC "Error: DAC_Config_Objects > No valid config number";
	};
	[]
};

_Object_Pool
