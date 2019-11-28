#include "../../defines.hpp"

params ["_control", "_path", "_action"];

switch (_action) do {
	case "FileOpen": {
		["Open", false/*save*/] call BRM_FMK_MPGarage_fnc_onSavesEvent;
	};
	case "FileSave": {
		["Open", true/*save*/] call BRM_FMK_MPGarage_fnc_onSavesEvent;
	};
	case "FileRandom": {
		private _idcsLeftTabs = IDCS_LEFT;

		// Remove empty tabs
		private _vehicles = (uiNamespace getVariable "MPG_display") getVariable "MPG_vehicles";
		for "_i" from (count _idcsLeftTabs - 1) to 0 step -1 do {
			if (count (_vehicles select _i) == 0) then {
				_idcsLeftTabs deleteAt _i;
			};
		};

		// Select random tab
		private _ctrlLeftTab = ctrlParent _control displayCtrl (selectRandom _idcsLeftTabs);
		[ctrlParent _ctrlLeftTab, _ctrlLeftTab] call BRM_FMK_MPGarage_fnc_onLeftTabSelect;

		// Select random vehicle
		private _ctrlLeftContent = ctrlParent _control displayCtrl IDC_MPG_LEFTCONTENT;
		_ctrlLeftContent lbSetCurSel (floor random (lbSize _ctrlLeftContent - 1));
	};
	case "FileExit": {
		ctrlParent _control closeDisplay 2;
	};
};
