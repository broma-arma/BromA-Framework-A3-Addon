// TODO Instead of rectangle marker, could use a polyline marker.
params ["_id", "_start", "_end", "_color", "_size"];

_start = [_start] call BRM_FMK_AIS_fnc_toPosition select [0, 2];
_end = [_end] call BRM_FMK_AIS_fnc_toPosition select [0, 2];
private _diff = _end vectorDiff _start;

private _distance = vectorMagnitude _diff * 0.5;
private _angle = _diff#0 atan2 _diff#1;
private _center = _start vectorAdd ([sin _angle, cos _angle] vectorMultiply _distance);

[global, format ["BRM_FMK_AIS_line_%1_%2_%3", _id, _start, _end], _center,
	"RECTANGLE", "SOLID", nil,
	_color, [_size, _distance], nil,
	_angle
] call BRM_FMK_fnc_newMarker
