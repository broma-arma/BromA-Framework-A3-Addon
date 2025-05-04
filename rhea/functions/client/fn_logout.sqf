#include "../../defines.hpp"

TRACE_1("fn_logout: %1", _this);

if ([] call BRM_FMK_RHEA_fnc_isLoggedIn) then {
	player remoteExec ["BRM_FMK_RHEA_SERVER_fnc_logoutPlayer", 2];

	[{ !([] call BRM_FMK_RHEA_fnc_isLoggedIn) }, {
		findDisplay getNumber (configFile >> "BRM_FMK_RHEA_main" >> "idd") closeDisplay 0;
		systemChat "RHEA: Logged out";
	}] call CBA_fnc_waitUntilAndExecute;
};
