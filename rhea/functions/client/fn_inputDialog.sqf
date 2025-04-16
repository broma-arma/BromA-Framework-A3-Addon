#include "../../defines.hpp"

TRACE_1("fn_inputDialog: %1", _this);

/*
Text Input Example:
	0 spawn {
		(["Name", "What is your name?", "John"] call BRM_FMK_RHEA_fnc_inputDialog) params ["_status", "_text"];
		if (_status) then {
			systemChat format ["Hello %1!", _text];
		};
	};
Combo Selection Example:
	0 spawn {
		(["Side", "Select a side:", "CIV", ["WEST", "EAST", "IND", "CIV"]] call BRM_FMK_RHEA_fnc_inputDialog) params ["_status", "_text"];
		if (_status) then {
			systemChat format ["You selected '%1'", _text];
		};
	};
Combo Selection Example #2:
	0 spawn {
		(["Side", "Select a side:", "Civilian", [
			// Text			Data	Tooltip							Picture		Value
			["Blufor",		"WEST",	"Select the blufor side.",		"westFlag",	0],
			["Opfor",		"EAST",	"Select the opfor side.",		"eastFlag",	1],
			["Independent",	"GUER",	"Select the independent side.",	"guerFlag",	2],
			["Civilian",	"CIV",	"Select the civilian side.",	"civFlag",	3]
		]] call BRM_FMK_RHEA_fnc_inputDialog) params ["_status", "_text", "_data", "_value"];
		if (_status) then {
			systemChat format ["You selected '%1' (Data: '%2', Value: '%3')", _text, _data, _value];
		};
	};
*/

if !(canSuspend) exitwith {"The function can only be called in a scheduled environment." call bis_fnc_error; [false]};

disableSerialization;

params [["_title", ""], ["_msg", "", ["", parseText ""]], ["_default", "", ["", 0]], ["_options", []]];

createDialog "BRM_FMK_RHEA_input";

private _dialog = uinamespace getvariable "BRM_FMK_RHEA_inputDialog";

private _ctrlTxtTitle = _dialog displayCtrl 9036;
private _ctrlSTxtMsg = _dialog displayCtrl 9136;
private _ctrlEditBox = _dialog displayCtrl 9436;
private _ctrlCmbBox = _dialog displayCtrl 10136;

_ctrlTxtTitle ctrlSetText (if (_title != "") then {_title} else {"Input"});

if (_msg isEqualType "") then {
	_msg = if (_msg != "") then {parseText _msg} else {"Enter your input:"};
};
_ctrlSTxtMsg ctrlSetStructuredText _msg;

if (count _options > 0) then {
	_ctrlEditBox ctrlEnable false;
	_ctrlEditBox ctrlSetFade 1;
	_ctrlEditBox ctrlCommit 0;
	_ctrlCmbBox ctrlEnable true;
	_ctrlCmbBox ctrlSetFade 0;
	_ctrlCmbBox ctrlCommit 0;
	ctrlSetFocus _ctrlCmbBox;

	private _optionNames = [];
	{
		if (_x isEqualType "") then {
			_ctrlCmbBox lbAdd _x;
			_optionNames pushBack _x;
		} else {
			if (_x isEqualType []) then {
				private _index = _forEachIndex;
				{
					switch (_forEachIndex) do {
						case 0: {
							_ctrlCmbBox lbAdd _x;
							_optionNames pushBack _x;
						};
						case 1: { _ctrlCmbBox lbSetData [_index, _x]; };
						case 2: { _ctrlCmbBox lbSetTooltip [_index, _x]; };
						case 3: { _ctrlCmbBox lbSetPicture [_index, _x]; };
						case 4: { _ctrlCmbBox lbSetValue [_index, _x]; };
					};
				} forEach _x;
			};
		};
	} forEach _options;

	private _index = 0;
	if (_default isEqualType 0) then {
		_index = _default;
	} else {
		if (_default != "") then {
			_index = _optionNames find _default;
		};
	};
	if (_index < 0) then { _index = 0; };
	_ctrlCmbBox lbSetCurSel _index;
} else {
	_ctrlEditBox ctrlEnable true;
	_ctrlEditBox ctrlSetFade 0;
	_ctrlEditBox ctrlCommit 0;
	_ctrlCmbBox ctrlEnable false;
	_ctrlCmbBox ctrlSetFade 1;
	_ctrlCmbBox ctrlCommit 0;
	ctrlSetFocus _ctrlEditBox;

	_ctrlEditBox ctrlSetText _default;
};

waitUntil {!isNil {uiNamespace getVariable "BRM_FMK_RHEA_inputDialog_status"}};

private _status = uiNamespace getVariable "BRM_FMK_RHEA_inputDialog_status";
private _result = [_status];
uiNamespace setVariable ["BRM_FMK_RHEA_inputDialog_status", nil];

if (_status) then {
	if (count _options > 0) then {
		private _index = lbCurSel _ctrlCmbBox;
		private _option = _options select _index;
		if (_option isEqualType "") then {
			_result pushBack (_ctrlCmbBox lbText _index);
		} else {
			if (_option isEqualType []) then {
				_result pushBack (_ctrlCmbBox lbText _index);
				_result pushBack (_ctrlCmbBox lbData _index);
				_result pushBack (_ctrlCmbBox lbValue _index);
			};
		};
	} else {
		_result pushBack (ctrlText _ctrlEditBox);
	};
};

closeDialog 2;

TRACE_1("fn_inputDialog: result=%1", _result);

_result
