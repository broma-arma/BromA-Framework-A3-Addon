#include "script_component.hpp"
params ["_side"];

private _inTrigger = thisList select { side _x == _side || (side _x == CIVILIAN && {_x isKindOf "AllVehicles" && {!(_x isKindOf "Man")}}) };
private _protected = (thisTrigger getVariable QGVAR(protected)) - [objNull];

private _added = (_inTrigger - _protected);
if (count _added > 0) then {
	[_added, false] remoteExec [QFUNC(allowDamage), 0];
};
_protected append _added;

private _removed = (_protected - _inTrigger);
if (count _removed > 0) then {
	[_removed, true] remoteExec [QFUNC(allowDamage), 0];
};
thisTrigger setVariable [QGVAR(protected), _protected - _removed];
