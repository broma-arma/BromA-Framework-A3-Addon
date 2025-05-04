#include "../../defines.hpp"

TRACE_1("fn_isLoggedIn: %1", _this);

params [["_player", objNull, [objNull]]];

if (isNull _player && hasInterface) then {
	_player = player;
};

!isNull _player && { _player getVariable ["BRM_FMK_RHEA_loggedIn", false] }
