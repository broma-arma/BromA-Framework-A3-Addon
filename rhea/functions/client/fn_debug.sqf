#include "../../defines.hpp"

//TRACE_1("fn_debug: %1", _this);

disableSerialization;

params ["_mode", "_params"];

// Based on ui_f/scripts/GUI/RscDebugConsole.sqf
switch _mode do {
	case "onLoad": {
		_params params ["_dialog"];

		private _ctrlExpression = _dialog displayCtrl 1400;
		private _ctrlExecuteGlobal = _dialog displayCtrl 2402;
		private _ctrlExecuteServer = _dialog displayCtrl 2403;
		private _ctrlExecuteClient = _dialog displayCtrl 2404;

		_ctrlExpression ctrlSetText (profileNamespace getVariable ["nfe_rhea_debug_expression", ""]);
		ctrlSetFocus _ctrlExpression;

		if (!isMultiplayer) then {
			_ctrlExecuteGlobal ctrlEnable false;
			_ctrlExecuteServer ctrlEnable false;
			_ctrlExecuteClient ctrlEnable false;
		};

		for "_i" from 1 to 5 do {
			private _ctrlInput = _dialog displayCtrl (1400 + _i);
			private _value = profileNamespace getVariable ["nfe_rhea_debug_watch" + str _i, [true, ""]];
			_ctrlInput ctrlSetText (_value select 1);
			_ctrlInput setVariable ["BRM_FMK_RHEA_debug_watchStatus", _value];
		};

		for "_i" from 1 to 5 do {
			private _handler = compile format ["['updateWatch', [%1, %2] + _this] call BRM_FMK_RHEA_fnc_debug;", 1400 + _i, 1405 + _i];
			_dialog displayAddEventHandler ["MouseMoving", _handler];
			_dialog displayAddEventHandler ["MouseHolding", _handler];
		};
	};

	case "updateWatch": {
		_params params ["_inputIDC", "_outputIDC", "_dialog", "_x", "_y", "_mouseOver"];

		private _ctrlInput = _dialog displayCtrl _inputIDC;
		private _ctrlOutput = _dialog displayCtrl _outputIDC;
		private _input = ctrlText _ctrlInput;
		if (_input isEqualTo "") exitWith {
			_ctrlInput ctrlSetBackgroundColor [0,0,0,0];
			_ctrlOutput ctrlSetText "";
		};
		private _status = _ctrlInput getVariable "BRM_FMK_RHEA_debug_watchStatus";
		if (!(_status select 0) && {_status select 1 isEqualTo _input}) exitWith {
			_ctrlInput ctrlSetBackgroundColor [0.5,0.1,0,0.8]
		};

		private _timeStart = diag_tickTime;
		_ctrlOutput ctrlSetText (_input call {
			_this = [nil] apply compile _this select 0;
			if (isNil "_this") exitWith {""};
			str _this
		});
		private _duration = diag_tickTime - _timeStart;

		if (_duration < 0.003) exitWith {
			_ctrlInput ctrlSetBackgroundColor [0,0,0,0];
			_status set [0, true];
		};
		_ctrlInput ctrlSetBackgroundColor [0.8,0.4,0,0.5];
		_status set [0, false];
		if (_duration > 0.1) exitWith {
			_status set [1, _input]
		};
		_status set [1, ""];
	};

	case "executeButton": {
		_params params ["_mode", "_control"];

		private _dialog = ctrlParent _control;
		private _ctrlInput = _dialog displayCtrl 1400;

		if (!isMultiplayer) then {
			_mode = 0; // Local
		};

		private _target = switch _mode do {
			case 0: { clientOwner }; // Local
			case 1: { 0 }; // Global
			case 2: { 2 }; // Server
			case 3: { -2 }; // Client
		};
		[[], compile ctrlText _ctrlInput] remoteExec ["call", _target];

		true
	};

	case "onUnload": {
		_params params ["_dialog"];

		private _ctrlExpression = _dialog displayCtrl 1400;
		profileNamespace setVariable ["nfe_rhea_debug_expression", ctrlText _ctrlExpression];

		for "_i" from 1 to 5 do {
			private _ctrlInput = _dialog displayCtrl (1400 + _i);
			private _value = _ctrlInput getVariable ["BRM_FMK_RHEA_debug_watchStatus", [true, ""]];
			if (_value select 1 isEqualTo "") then {_value set [0, true]};
			_value set [1, ctrlText _ctrlInput];
			profileNamespace setVariable ["nfe_rhea_debug_watch" + str _i, _value];
		};
		saveProfileNamespace;
	};
};