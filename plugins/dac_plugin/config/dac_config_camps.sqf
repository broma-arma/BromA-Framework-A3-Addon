if ([BRM_version, [0, 7, 5]] call BRM_FMK_fnc_versionCompare <= 0) exitWith {
	DAC_fConfigCamps = compile preprocessFileLineNumbers "dac\dac_config_camps.sqf";
	_this call DAC_fConfigCamps
};

params ["_index"];

private ["_campBasic", "_campAmmo", "_campStatic", "_campWall", "_campObjInit", "_campUserObj", "_campAddUnit", "_campRandomObj", "_side"];

#include "\broma_framework\loadouts\includes\vehicles-index.sqf"
#include "\broma_framework\loadouts\includes\faction-info-index.sqf"

switch (_index) do {
	case 0: { // OPFOR
		_side = EAST;
	};
	case 1: { // BLUFOR
		_side = WEST;
	};
	case 2: { // INDFOR
		_side = RESISTANCE;
	};
};

if (!isNil "_side") then {
	private _campInfo = [_side] call BRM_FMK_DAC_fnc_generateCampInfo;
	_campBasic     = _campInfo select CAMP_RET_BASIC;
	_campAmmo      = _campInfo select CAMP_RET_OBJECTS;
	_campStatic    = _campInfo select CAMP_RET_STATIC;
	_campAddUnit   = _campInfo select CAMP_RET_GUARDS; // TODO Test if need to call BRM_FMK_fnc_initAI for these units in _campObjInit
	_campUserObj   = [];
	_campRandomObj = [];
	_campWall      = _campInfo select CAMP_RET_WALLS;
	_campObjInit = [[], [format ["[_x, '%1', %2] remoteExecCall ['BRM_FMK_fnc_assignCargo', 2];", _side, _campInfo select CAMP_RET_AMMO]], [], [], [], [], []];
};

if (isNil "BRM_FMK_DAC_cfgCamps") then {
	BRM_FMK_DAC_cfgCamps = if (fileExists "dac\dac_config_camps.sqf") then { compile preprocessFileLineNumbers "dac\dac_config_camps.sqf" } else { {} };
};
call BRM_FMK_DAC_cfgCamps;

if (DAC_Basic_Value != 5 && (isNil "_campBasic" || isNil "_campAmmo" || isNil "_campStatic" || isNil "_campAddUnit" || isNil "_campUserObj" || isNil "_campRandomObj" || isNil "_campWall" || isNil "_campObjInit")) exitWith {
	DAC_Basic_Value = 5; publicVariable "DAC_Basic_Value";
	systemChat "Error: DAC_Config_Camps > No valid config number";
};

[_campBasic, _campAmmo, _campStatic, _campAddUnit, _campUserObj, _campRandomObj, _campWall, _campObjInit]
