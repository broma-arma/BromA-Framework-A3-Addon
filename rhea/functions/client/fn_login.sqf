#include "../../defines.hpp"

TRACE_1("fn_login: %1", _this);

disableSerialization;

params ["_dialog"];

private _ctrlErrorText = _dialog displayCtrl 1006;
private _ctrlPassText = _dialog displayCtrl 1400;

_ctrlErrorText ctrlSetText "Logging in...";

if (isMultiplayer) then {
	player setVariable ["BRM_FMK_RHEA_waiting", true, true];

	[player, (ctrlText _ctrlPassText)] remoteExec ["BRM_FMK_RHEA_SERVER_fnc_loginPlayer", 2];

	_ctrlErrorText ctrlSetTextColor [1, 1, 1, 1];

	[{
		disableSerialization;

		params ["_ctrlErrorText", "_ctrlPassText", "_stepArray"];
		_stepArray params ["_stepTime", "_step"];

		private _time = time;
		if (_time - _stepTime >= 0.1) then {
			_step = _step + 1;
			_ctrlErrorText ctrlSetText ("Logging in" + ("..." select [0, _step]));
			_stepArray set [0, _time];
			_stepArray set [1, _step % 3];
		};

		!(player getVariable ["BRM_FMK_RHEA_waiting", true])
	}, {
		disableSerialization;

		params ["_ctrlErrorText", "_ctrlPassText"];

		_ctrlErrorText ctrlSetTextColor [
			profilenamespace getvariable ["IGUI_ERROR_RGB_R",0.8],
			profilenamespace getvariable ["IGUI_ERROR_RGB_G",0.0],
			profilenamespace getvariable ["IGUI_ERROR_RGB_B",0.0],
			profilenamespace getvariable ["IGUI_ERROR_RGB_A",1.0]
		];

		if !(player getVariable ["BRM_FMK_RHEA_loggedIn", false]) then {
			_ctrlErrorText ctrlSetText "Bad credentials!";
		} else {
			_ctrlErrorText ctrlSetText "";
			(uiNamespace getVariable ["BRM_FMK_RHEA_loginDialog", displayNull]) closeDisplay 0;
			findDisplay getNumber (configFile >> "RscDisplayMission" >> "idd") createDisplay "BRM_FMK_RHEA_main";
		};
	}, [_ctrlErrorText, _ctrlPassText, [time, 0]]] call CBA_fnc_waitUntilAndExecute;
} else {
	player setVariable ["BRM_FMK_RHEA_loggedIn", true];
	_ctrlErrorText ctrlSetText "";
	(uiNamespace getVariable ["BRM_FMK_RHEA_loginDialog", displayNull]) closeDisplay 0;
	findDisplay getNumber (configFile >> "RscDisplayMission" >> "idd") createDisplay "BRM_FMK_RHEA_main";
};
