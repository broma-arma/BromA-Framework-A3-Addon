#include "script_component.hpp"
// TODO Remove _trigger? Seems all uses of it has the same value as _center. So could do the same functionality if _center is a trigger
diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_center", ["_radius", 0], ["_objectDistance", 5], ["_blacklist", []]];

_center = [_center] call FUNC(toPosition);

// TODO Use findEmptyPosition instead of BIS_fnc_findSafePos?
// TODO Why is _radius forcibly increased by 50?
// TODO Add failure handling to function invokers, currently quick fixed to just return _center, rather than [0, 0, 0].
private _position = [];
if (_center isEqualType objNull && { _center isKindOf "EmptyDetector" }) then {
	private _triggerArea = triggerArea _center;
	_radius = _triggerArea#0 max _triggerArea#1;

	waitUntil { // TODO Should have an attempt limit on this.
		_position = [_center, 0, _radius + 50, _objectDistance, 0, 0.05, 0, _blacklist, [_center, _center]] call BIS_fnc_findSafePos;
		sleep 0.01;
		_position inArea _center
	};
} else {
	_position = [_center, 0, _radius + 50, _objectDistance, 0, 0.05, 0, _blacklist, [_center, _center]] call BIS_fnc_findSafePos;
};

_position set [2, 0];
_position
