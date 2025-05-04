#include "../../defines.hpp"

TRACE_1("fn_receiveMessage: %1", _this);

if !([] call BRM_FMK_RHEA_fnc_isLoggedIn) exitWith {};

systemChat format (["(to Admin) %1: %2"] + _this);
playSound "3DEN_notificationWarning";
