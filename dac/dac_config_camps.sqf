#include "\broma_framework\loadouts\includes\faction-info-index.sqf"

params ["_type"];

private _params = ["_campBasic", "_campAmmo", "_campStatic", "_campAddUnit", "_campUserObj", "_campRandomObj", "_campWall", "_campObjInit"];
private _params;

if (_type >= 0 && _type < 3) then {
	private _campInfo = [[OPFOR, BLUFOR, INDEPENDENT] select _type] call BRM_FMK_DAC_fnc_generateCampInfo;
	_campBasic = _campInfo select CAMP_RET_BASIC;
	_campAmmo = _campInfo select CAMP_RET_OBJECTS;
	_campStatic = _campInfo select CAMP_RET_STATIC;
	_campAddUnit = _campInfo select CAMP_RET_GUARDS;
	_campUserObj = [];
	_campRandomObj = [];
	_campWall = _campInfo select CAMP_RET_WALLS;
	_campObjInit = [
		[],
		[format ["[_x, ""%1"", %2] remoteExecCall [""BRM_fnc_assignCargo"", 2];", ["opfor", "blufor", "indfor"] select _type, _campInfo select CAMP_RET_AMMO]],
		[],
		[],
		[],
		[],
		[]
	];
};

if (fileExists "mission\settings\dac\dac_config_camps.sqf") then {
	[_type] call compile preprocessFileLineNumbers "mission\settings\dac\dac_config_camps.sqf";
};

if (_params findIf { isNil _x } != -1) exitWith {
	if (DAC_Basic_Value != 5) then {
		DAC_Basic_Value = 5; publicVariable "DAC_Basic_Value";
		hintC "Error: DAC_Config_Camps > No valid config number";
	};
	[]
};

[_campBasic, _campAmmo, _campStatic, _campAddUnit, _campUserObj, _campRandomObj, _campWall, _campObjInit]
