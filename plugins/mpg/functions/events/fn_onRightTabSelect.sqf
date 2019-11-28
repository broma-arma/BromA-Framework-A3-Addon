#include "../../defines.hpp"

params ["_display", "_control", ["_autoFocus", true]];

if (isNull _control) then {
	_control = _display displayCtrl (IDCS_RIGHT select 0);
};

private _ctrlIDC = ctrlIDC _control;
private _index = IDCS_RIGHT find _ctrlIDC;

// Hide pylon config.
{
	(_display displayCtrl _x) ctrlShow false;
} forEach [IDC_MPG_PYLONCONFIG_BACKGROUND, IDC_MPG_PYLONCONFIG];

// Show right tabs, search, and search button.
{
	(_display displayCtrl _x) ctrlShow true;
} forEach [IDC_MPG_RIGHTTABSBACKGROUND, IDC_MPG_RIGHTTABS, IDC_MPG_RIGHTSEARCH, IDC_MPG_RIGHTSEARCHBUTTON];

// Darken the selected button. https://feedback.bistudio.com/T78904
private _groupPosition = ctrlPosition ctrlParentControlsGroup _control;
private _position = ctrlPosition _control;
for "_i" from 0 to 1 do {
	_position set [_i, (_groupPosition select _i) + (_position select _i)];
};

private _ctrlTabRightBackground = _display displayCtrl IDC_MPG_TABRIGHTBACKGROUND;
_ctrlTabRightBackground ctrlSetPosition _position;
_ctrlTabRightBackground ctrlCommit 0;

// Fill the list.
[_display, _index, _autoFocus] call BRM_FMK_MPGarage_fnc_loadRightContent;
