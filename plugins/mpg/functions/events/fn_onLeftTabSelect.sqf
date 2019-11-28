#include "../../defines.hpp"

params ["_display", "_control", ["_autoFocus", true]];

private _ctrlIDC = ctrlIDC _control;
private _index = IDCS_LEFT find _ctrlIDC;

// Darken the selected button. https://feedback.bistudio.com/T78904
private _groupPosition = ctrlPosition ctrlParentControlsGroup _control;
private _position = ctrlPosition _control;
for "_i" from 0 to 1 do { // _groupPosition[x, y] + _position[x, y]
	_position set [_i, (_groupPosition select _i) + (_position select _i)];
};

private _ctrlTabLeftBackground = _display displayCtrl IDC_MPG_TABLEFTBACKGROUND;
_ctrlTabLeftBackground ctrlSetPosition _position;
_ctrlTabLeftBackground ctrlCommit 0;

// Fill the list.
[_display, _index, _autoFocus] call BRM_FMK_MPGarage_fnc_loadLeftContent;
