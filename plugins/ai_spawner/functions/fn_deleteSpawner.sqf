#include "script_component.hpp"
diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_id"];

!isNil { GVAR(spawners) deleteAt _id }
