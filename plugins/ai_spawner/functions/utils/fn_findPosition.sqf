// TODO Remove _trigger? Seems all uses of it has the same value as _center. So could do the same functionality if _center is a trigger
params ["_center", ["_radius", 0], ["_trigger", objNull], ["_objectDistance", 5], ["_occupiedPositions", []]];

_center = [_center] call BRM_FMK_AIS_fnc_toPosition;

// TODO Use findEmptyPosition instead of BIS_fnc_findSafePos?
// TODO Why is _radius forcibly increased by 50?
// TODO Add failure handling to function invokers, currently quick fixed to just return _center, rather than [0, 0, 0].
private _position = [];
if (isNull _trigger) then {
	_position = [_center, 0, _radius + 50, _objectDistance, 0, 0.05, 0, _occupiedPositions, [_center, _center]] call BIS_fnc_findSafePos;
} else {
	private _triggerArea = triggerArea _trigger;
	_radius = _triggerArea#0 max _triggerArea#1;

	waitUntil { // TODO Should have an attempt limit on this.
		_position = [_center, 0, _radius + 50, _objectDistance, 0, 0.05, 0, _occupiedPositions, [_center, _center]] call BIS_fnc_findSafePos;
		_position inArea _trigger;
	};
};

_position set [2, 0];
_position
