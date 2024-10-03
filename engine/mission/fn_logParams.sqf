/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_logParams

AUTHOR(s):
    Coryf88

DESCRIPTION:
   Beautifies mission parameters log in the diary

PARAMETERS:
    None.

USAGE:
    _this call BRM_FMK_Engine_fnc_logParams

RETURNS:
    Nothing.

================================================================================
*/

private _diaryRecord = player allDiaryRecords "log";
private _i = _diaryRecord findIf { _x#1 == "Parameters" };
if (_i == -1) exitWith {};
_diaryRecord = _diaryRecord select _i select 8;

private _diaryArray = [];
private _fnc_pushToDiaryArray = {
	params ["_cfg", "_value", ["_param", ""]];

	private _title = getText (_cfg >> format ["title%1", _param]);
	private _emptyTitle = false;
	if (_title isEqualTo "") then {
		_emptyTitle = true;
		_title = [_param, configName _cfg] select (_param isEqualTo "");
	};

	private _values = getArray (_cfg >> format ["values%1", _param]);
	_value = getArray (_cfg >> format ["texts%1", _param]) param [_values find _value, _value];

	private _emptyValue = _value isEqualTo "";
	if (_emptyTitle && _emptyValue) then { // Seperator
		_diaryArray pushBack "";
	} else {
		if (_emptyValue && count _values == 1) then { // Section title
			_diaryArray pushBack format ["<font size='16' face='RobotoCondensedBold'>%1</font>", _title trim [" =", 0]];
		} else { // Parameter
			_diaryArray pushBack format ["%1: <font face='PuristaLight'>%2</font>", _title, _value];
		};
	};
};

{
	private _value = [_x, nil] call BIS_fnc_getParamValue;
	if (!isNil "_value") then {
		[missionConfigFile, _value, _x] call _fnc_pushToDiaryArray;
	};
} forEach ["param1", "param2"];

{
	[_x, configName _x call BIS_fnc_getParamValue] call _fnc_pushToDiaryArray
} forEach ("true" configClasses getMissionConfig "Params");

if !(_diaryArray isEqualTo []) then {
	player setDiaryRecordText [["log", _diaryRecord], [localize "STR_DISP_XBOX_EDITOR_WIZARD_PARAMS", _diaryArray joinString "<br />"]];
};
