#include "script_component.hpp"
params ["_side"];

if (triggerActivated thisTrigger) exitWith { false };

private _inTrigger = thisList select { side _x == _side || (side _x == CIVILIAN && {_x isKindOf "AllVehicles" && {!(_x isKindOf "Man")}}) };
private _protected = thisTrigger getVariable QGVAR(protected);
(count (_inTrigger - _protected) + count (_protected - _inTrigger)) > 0
