params ["_center",["_radius",0],["_trigger",objNull],["_objectDistance",5],["_occupiedPositions",[]]];

private _position = [];
_center = [_center] call BRM_FMK_AIS_fnc_toPosition;

if (isNull _trigger) then {
	_position = [_center, 0, _radius+50, _objectDistance, 0, 0, 0,_occupiedPositions,[[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos;
} else {
	private _triggerArea = (triggerArea _trigger);
	_radius = if (_triggerArea select 0 > _triggerArea select 1) then {_triggerArea select 0} else {_triggerArea select 1};

	waitUntil {
		_position = [_center, 0, _radius+50, _objectDistance, 0, 0, 0,_occupiedPositions,[[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos;
		_position inArea _trigger;
	};
};

_position = [_position select 0, _position select 1, 0]; // convert to xyz pos
_position
