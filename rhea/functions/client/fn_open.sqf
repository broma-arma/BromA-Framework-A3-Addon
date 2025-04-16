#include "../../defines.hpp"

TRACE_1("fn_open: %1", _this);

params [["_parentDisplay", findDisplay getNumber (configFile >> "RscDisplayMission" >> "idd")]];

private _mainDisplay = findDisplay getNumber (configFile >> "BRM_FMK_RHEA_main" >> "idd");
if (!isNull _mainDisplay) then {
	_mainDisplay closeDisplay 0;
} else {
	private _loginDialog = uiNamespace getVariable ["BRM_FMK_RHEA_loginDialog", displayNull];
	if (!isNull _loginDialog) then {
		_loginDialog closeDisplay 0;
	} else {
		private _display = _parentDisplay createDisplay (if !(player getVariable ["BRM_FMK_RHEA_loggedIn", false]) then {
			"BRM_FMK_RHEA_login"
		} else {
			"BRM_FMK_RHEA_main"
		});

		if (count _this > 1) then {
			// Workaround for https://github.com/CBATeam/CBA_A3/issues/1264
			[{ _this call CBA_events_fnc_keyHandlerUp; }, _this] call CBA_fnc_execNextFrame;
		};
	};
};
