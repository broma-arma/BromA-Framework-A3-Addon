#include "../../defines.hpp"

params ["_display", "_control"];

private _ctrlIDC = ctrlIDC _control;
(switch (_ctrlIDC) do {
	case IDC_MPG_LEFTSEARCH;
	case IDC_MPG_LEFTSEARCHBUTTON:  { [IDC_MPG_LEFTSEARCH, IDC_MPG_LEFTCONTENT] };
	case IDC_MPG_RIGHTSEARCH;
	case IDC_MPG_RIGHTSEARCHBUTTON: { [IDC_MPG_RIGHTSEARCH, IDC_MPG_RIGHTCONTENT] };
	default { [-1, -1] };
}) params ["_search", "_ctrlContent"];

if (_search < 0 || _ctrlContent < 0) exitWith {
	["Invalid search control '%1', expected: %2 or %3", _ctrlIDC, IDC_MPG_LEFTSEARCHBUTTON, IDC_MPG_RIGHTSEARCHBUTTON] call BIS_fnc_error;
};

// Reload content
if (_ctrlContent == IDC_MPG_LEFTCONTENT) then {
	[_display, _display getVariable ["MPG_leftTab", 0], false] call BRM_FMK_MPGarage_fnc_loadLeftContent;
} else {
	[_display, _display getVariable ["MPG_rightTab", 0], false] call BRM_FMK_MPGarage_fnc_loadRightContent;
};

_search = toLower ctrlText (_display displayCtrl _search);
_ctrlContent = _display displayCtrl _ctrlContent;

for "_i" from lbSize _ctrlContent - 1 to 0 step -1 do {
	private _lbText = toLower (_ctrlContent lbText _i);
	private _lbData = toLower (_ctrlContent lbData _i);

	if (_lbText isEqualTo "" || {_lbText find _search == -1 && {_lbData find _search == -1}}) then {
		_ctrlContent lbDelete _i;
	};
};

_ctrlContent lbSetCurSel -1;
