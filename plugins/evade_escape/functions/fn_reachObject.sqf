#include "script_component.hpp"
if (isNil QUOTE(DOUBLES(DEPRECATED,FUNC(reachObject)))) then {
	["Function is deprecated, use BRM_FMK_fnc_reachTarget"] remoteExec ["BIS_fnc_error", 0];
	DOUBLES(DEPRECATED,FUNC(reachObject)) = true;
};

if (!isServer) exitWith {};

params ["_list", "_obj", "_safeDistance", "_code"];

[_list apply { if (_x isEqualType "") then { call compile _x } else { _x } }, _obj, if (_code isEqualType "") then { compile _code } else { _code }, _safeDistance, 10] call FUNCMAIN(reachTarget);
