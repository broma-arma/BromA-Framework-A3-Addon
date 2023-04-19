#include "script_component.hpp"
/*
================================================================================

NAME:
    BRM_FMK_fnc_getPluginSettings

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Loads a plugin's settings.

PARAMETERS:
    0 - The plugin id (STRING)
    1+- Default setting (ARRAY)
        0 - Default value (ANY)
        1 - (OPTIONAL) Valid value data types. Default: [] (ARRAY)
        2 - (OPTIONAL) Setting's old global variable or an array of default setting values. Default: "" (STRING|ARRAY)
        3 - (OPTIONAL) Code that modifies the value. Code is also applied to the default value. Default: nil (CODE)
        4 - (OPTIONAL) Code that modifies the old global variable value. Default: nil (CODE)

USAGE:
    ["plugin", [[], [[]], "plugin_old_array"], [true, [true], "plugin_old_bool"], [0, [0], "plugin_old_number"]] call BRM_FMK_fnc_getPluginSettings;

RETURNS:
    Nothing

================================================================================
*/

params ["_plugin"];

private _var = nil;
private _settings = nil;
if (_plugin isEqualType "") then {
	_var = format [QGVARMAIN(PluginSettings_%1), _plugin];
	_settings = missionNamespace getVariable _var;
	if (!isNil "_settings") exitWith { _settings };
	_settings = [];

	private _settingFile = format ["settings\plugins\%1.sqf", _plugin];
	if (fileExists _settingFile) then {
		// TODO Check if can catch compilation errors and inform user
		_settings = call compile preprocessFileLineNumbers _settingFile;
	};
} else {
	_settings = _plugin;
};

private _BRM075 = [BRM_version, [0, 7, 5]] call FUNCMAIN(versionCompare) <= 0;

private _settingsCount = count _settings;
for "_i" from 1 to count _this - 1 do {
	_this select _i params ["_defaultValue", ["_expectedDataTypes", [], [[]]], ["_oldVar", "", ["", []]], ["_code", nil, [{}]], ["_oldCode", nil, [{}]]];
	private _j = _i - 1;
	private _value = nil;

	if (_j < _settingsCount) then {
		_value = _settings select _j;
	};
	if (_oldVar isEqualType []) then {
		_value = [_value] + _oldVar call FUNCMAIN(getPluginSettings);
	} else {
		if (_BRM075 && { isNil "_value" && _oldVar != "" }) then {
			_value = missionNamespace getVariable _oldVar;
			if (!isNil "_oldCode") then {
				_value = _value call _oldCode;
			};
		};
	};

	if (isNil "_value" || { !(_value isEqualTypeAny _expectedDataTypes) }) then {
		_value = _defaultValue;
	};
	if (!isNil "_code") then {
		_value = _value call _code;
	};
	_settings set [_j, _value];
};

if (!isNil "_var") then {
	missionNamespace setVariable [_var, _settings];
};

_settings
