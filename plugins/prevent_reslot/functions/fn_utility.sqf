[] spawn {
	disableSerialization;

	private _display = findDisplay getNumber (configFile >> 'BRM_FMK_RHEA_main' >> 'idd') createDisplay "RscDisplayEmpty";
	_display setVariable ["removeLockUIDs", []];
	_display displayAddEventHandler ["Unload", {
		params ["_display", "_exitCode"];

		if (_exitCode == 1) then {
			private _removeLockUIDs = _display getVariable "removeLockUIDs";
			if (_removeLockUIDs isNotEqualTo []) then {
				_removeLockUIDs remoteExec ["BRM_FMK_Plugin_PreventReslot_fnc_unlockSlots", 2];
			};
		};
	}];

	private _ctrlBackground = _display ctrlCreate ["ctrlStaticBackground", 1000];
	_ctrlBackground ctrlSetPosition [0, 0, 1, 1];
	_ctrlBackground ctrlCommit 0;

	private _ctrlList = _display ctrlCreate ["ctrlListNBox", 1001];
	_ctrlList ctrlEnable false;
	_ctrlList ctrlSetFontHeight 0.03;
	_ctrlList ctrlSetPosition [0, 0, 1, 0.9];
	_ctrlList ctrlCommit 0;
	_ctrlList lnbAddColumn 0.33;
	_ctrlList lnbAddColumn 0.66;
	_ctrlList lnbAddRow ["Loading...", "", ""];

	private _ctrlBtnDelete = _display ctrlCreate ["ctrlButton", 1002];
	_ctrlBtnDelete ctrlEnable false;
	_ctrlBtnDelete ctrlSetText "Delete";
	_ctrlBtnDelete ctrlSetPosition [0.45, 0.925, 0.1, 0.05];
	_ctrlBtnDelete ctrlSetBackgroundColor [0, 0, 0, 1];
	_ctrlBtnDelete ctrlCommit 0;
	_ctrlBtnDelete ctrlAddEventHandler ["ButtonClick", {
		params ["_control"];

		private _display = ctrlParent _control;
		private _ctrlList = ctrlParent _control displayCtrl 1001;
		private _selectedRow = lnbCurSelRow _ctrlList;
		if (_selectedRow != -1) then {
			private _lockedSlots = _display getVariable "lockedSlots";
			_display getVariable "removeLockUIDs" pushBack (_lockedSlots deleteAt (_ctrlList lnbValue [_selectedRow, 0]) select 0);

			lnbClear _ctrlList;
			{
				_x params [["_uid", ""], ["_var", "nil"], ["_name", ""], ["_role", ""]];
				private _row = _ctrlList lnbAddRow [_var, _name, _role];
				_ctrlList lnbSetValue [[_row, 0], _forEachIndex];
			} forEach _lockedSlots;
			_ctrlList lnbSort [1, false];
			lnbSize _ctrlList params ["_rowSize", "_colSize"];
			if (_selectedRow >= _rowSize) then {
				_selectedRow = _rowSize - 1;
			};
			_ctrlList lnbSetCurSelRow _selectedRow;
		};
	}];

	private _ctrlBtnCancel = _display ctrlCreate ["ctrlButtonCancel", 1002];
	_ctrlBtnCancel ctrlSetPosition [0.775, 0.925, 0.1, 0.05];
	_ctrlBtnCancel ctrlSetBackgroundColor [0, 0, 0, 1];
	_ctrlBtnCancel ctrlCommit 0;
	_ctrlBtnCancel ctrlAddEventHandler ["ButtonClick", {
		params ["_control"];

		ctrlParent _control closeDisplay 2;
	}];

	private _ctrlBtnOk = _display ctrlCreate ["ctrlButtonOK", 1002];
	_ctrlBtnOk ctrlEnable false;
	_ctrlBtnOk ctrlSetText "Apply";
	_ctrlBtnOk ctrlSetPosition [0.9, 0.925, 0.1, 0.05];
	_ctrlBtnOk ctrlSetBackgroundColor [0, 0, 0, 1];
	_ctrlBtnOk ctrlCommit 0;
	_ctrlBtnOk ctrlAddEventHandler ["ButtonClick", {
		params ["_control"];

		ctrlParent _control closeDisplay 1;
	}];

	private _uidSlots = [missionNamespace, "BRM_FMK_Plugin_PreventReslot_uidSlots"] call BIS_fnc_getServerVariable; // Blocks execution
	private _lockedSlots = [missionNamespace, "BRM_FMK_Plugin_PreventReslot_lockedSlots"] call BIS_fnc_getServerVariable; // Blocks execution
	if (!isServer) then {
		// BIS_fnc_getServerVariable sets the variable
		BRM_FMK_Plugin_PreventReslot_uidSlots = nil;
		BRM_FMK_Plugin_PreventReslot_lockedSlots = nil;
	};

	if (!isNull _display) then {
		lnbClear _ctrlList;
		if (isNil "_uidSlots" || isNil "_lockedSlots") then {
			_ctrlList lnbAddRow ["Error: Server returned nil", "", ""];
		} else {
			private _slots = _uidSlots apply { [_x, _y] + (_lockedSlots get _y) };
			_display setVariable ["lockedSlots", +_slots];
			{
				_x params [["_uid", ""], ["_var", "nil"], ["_name", ""], ["_role", ""]];
				private _row = _ctrlList lnbAddRow [_var, _name, _role];
				_ctrlList lnbValue [[_row, 0], _forEachIndex];
				_ctrlList lnbSetData [[_row, 0], _uid];
			} forEach _slots;
			_ctrlList lnbSort [1, false];

			_ctrlList ctrlEnable true;
			_ctrlBtnDelete ctrlEnable true;
			_ctrlBtnOk ctrlEnable true;
		};
	};
};
