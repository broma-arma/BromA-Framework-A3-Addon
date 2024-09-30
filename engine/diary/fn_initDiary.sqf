params ["_display"];

private _ctrlSubjectList = _display displayCtrl 1001;
private _ctrlRecordList = _display displayCtrl 1002;

_display setVariable ["BRM_FMK_Engine_initDiary_fireEvent", {
	params ["_display", "_subjectList"];
	{
		if (!isNil "_x") then {
			_x params ["_code", "_thisArgs"];
			private _thisEventHandler = _forEachIndex;
			[_display, _subjectList] + BRM_FMK_Engine_initDiary_selected call _code;
		};
	} forEach BRM_FMK_Engine_fnc_onDiaryChanged_codes;
}];

_display setVariable ["BRM_FMK_Engine_initDiary_recordId", {
	// "Task:0" or "Record0"
	parseNumber (_this select [[6, 5] select (_this select [0, 5] == "Task:")])
}];

BRM_FMK_Engine_initDiary_selected = [_ctrlSubjectList lbData lbCurSel _ctrlSubjectList, _ctrlRecordList lnbText [lbCurSel _ctrlRecordList, 0], (_ctrlRecordList lnbData [lbCurSel _ctrlRecordList, 0]) call (_display getVariable "BRM_FMK_Engine_initDiary_recordId")];
[_display, true] call (_display getVariable "BRM_FMK_Engine_initDiary_fireEvent");

BRM_FMK_Engine_initDiary_diaryTopicListChanged = false;

_ctrlSubjectList ctrlAddEventHandler ["LBSelChanged", {
	params ["_ctrl", "_lbIndex"];

	private _selected = _ctrl lbData _lbIndex;
	if (_selected != BRM_FMK_Engine_initDiary_selected#0) then {
		BRM_FMK_Engine_initDiary_selected set [0, _selected];
		BRM_FMK_Engine_initDiary_diaryTopicListChanged = true;
		[{
			params ["_display"];
			private _ctrlRecordList = _display displayCtrl 1002;
			BRM_FMK_Engine_initDiary_selected set [1, _ctrlRecordList lnbText [lbCurSel _ctrlRecordList, 0]];
			BRM_FMK_Engine_initDiary_selected set [2, (_ctrlRecordList lnbData [lbCurSel _ctrlRecordList, 0]) call (_display getVariable "BRM_FMK_Engine_initDiary_recordId")];
			[_display, true] call (_display getVariable "BRM_FMK_Engine_initDiary_fireEvent");
			BRM_FMK_Engine_initDiary_diaryTopicListChanged = false;
		}, [ctrlParent _ctrl]] call CBA_fnc_execNextFrame;
	};
}];

_ctrlRecordList ctrlAddEventHandler ["LBSelChanged", {
	params ["_ctrl", "_lbIndex"];

	if (!BRM_FMK_Engine_initDiary_diaryTopicListChanged) then {
		private _display = ctrlParent _ctrl;
		private _selected = (_ctrl lnbData [_lbIndex, 0]) call (_display getVariable "BRM_FMK_Engine_initDiary_recordId");
		if (_selected != BRM_FMK_Engine_initDiary_selected#2) then {
			BRM_FMK_Engine_initDiary_selected set [1, _ctrl lnbText [_lbIndex, 0]];
			BRM_FMK_Engine_initDiary_selected set [2, _selected];
			[_display, false] call (_display getVariable "BRM_FMK_Engine_initDiary_fireEvent");
		};
	};
}];

_display displayAddEventHandler ["Unload", {
	params ["_display", "_exitCode"];

	BRM_FMK_Engine_initDiary_selected = ["", "", -1];
	[_display, true] call (_display getVariable "BRM_FMK_Engine_initDiary_fireEvent");
}];

if (ctrlIDD _display == 12) then {
	addMissionEventHandler ["Map", {
		params ["_opened", "_forced"];

		private _display = findDisplay 12;
		if (_opened) then {
			private _ctrlSubjectList = _display displayCtrl 1001;
			private _ctrlRecordList = _display displayCtrl 1002;
			BRM_FMK_Engine_initDiary_selected = [_ctrlSubjectList lbData lbCurSel _ctrlSubjectList, _ctrlRecordList lnbText [lbCurSel _ctrlRecordList, 0], (_ctrlRecordList lnbData [lbCurSel _ctrlRecordList, 0]) call (_display getVariable "BRM_FMK_Engine_initDiary_recordId")];
			[_display, true] call (_display getVariable "BRM_FMK_Engine_initDiary_fireEvent");
		} else {
			BRM_FMK_Engine_initDiary_selected = ["", "", -1];
			[_display, true] call (_display getVariable "BRM_FMK_Engine_initDiary_fireEvent");
		};
	}];
};
