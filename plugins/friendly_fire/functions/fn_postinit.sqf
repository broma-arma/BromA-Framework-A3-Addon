#include "script_component.hpp"
if !(hasInterface) exitWith {};

GVAR(alerts) = createHashMap;
player addEventHandler ["Hit", { _this call FUNC(alert) }];
