#include "../defines.hpp"

params ["_display", "_index", ["_autoFocus", true]];

_display setVariable ["MPG_leftTab", _index];

private _search = ctrlText (_display displayCtrl IDC_MPG_LEFTSEARCH);
private _control = _display displayCtrl IDC_MPG_LEFTCONTENT;

lbClear _control;

private _fnc_configModName = {
	private _addons = configSourceAddonList _this;
	if (count _addons > 0) exitWith {
		configSourceMod (configFile >> "CfgPatches" >> _addons select 0)
	};
	""
};

private _cfgVehicles = _display getVariable "MPG_vehicles" select _index;
private _modListOrder = _display getVariable "MPG_modListOrder";
{
	private _cfgVehicle = _x select 0;
	private _lbIndex = _control lbAdd getText (_cfgVehicle >> "displayName");
	_control lbSetData [_lbIndex, configName _cfgVehicle];
	_control lbSetTooltip [_lbIndex, configName _cfgVehicle];
	_control lbSetPicture [_lbIndex, getText (_cfgVehicle >> "picture")];

	private _lbValue = _forEachIndex;
	private _configModName = _cfgVehicle call _fnc_configModName;
	if (_configModName != "") then {
		modParams [_configModName, ["name", "logo"]] params [["_modName", ""], ["_modLogo", ""]];
		private _modID = _modListOrder find _modName;
		if (_modID == -1) then {
			_modID = _modListOrder pushBack _modName;
		};
		_lbValue = _lbValue + (count _cfgVehicles * (_modID + 1));
		_control lbSetPictureRight [_lbIndex, _modLogo];
	};

	_control lbSetValue [_lbIndex, _lbValue];
} forEach _cfgVehicles;

// Apply choosen sort
private _ctrlLeftSort = _display displayCtrl IDC_MPG_LEFTSORT;
_ctrlLeftSort lbSetCurSel lbCurSel _ctrlLeftSort;
_display displayCtrl IDC_MPG_LEFTCONTENT lbSetCurSel 0;

if (_autoFocus) then {
	ctrlSetFocus _control;
};
