params [
	"_id",
	"_start",
	"_end",
	"_color",
	"_size"
];

_start = [_start] call BRM_FMK_AIS_fnc_toPosition;
_end = [_end] call BRM_FMK_AIS_fnc_toPosition;

private _distance = sqrt(((_end select 0)-(_start select 0))^2+((_end select 1)-(_start select 1))^2) * 0.5;
private _angle = ((_end select 0)-(_start select 0)) atan2 ((_end select 1)-(_start select 1));
private _center = [(_start select 0)+sin(_angle)*_distance,(_start select 1)+cos(_angle)*_distance];

private _marker = createMarker [format ["ais_line_%1_%2_%3",_id,_start,_end],_center];
_marker setMarkerDir _angle;
_marker setMarkerPos _center;
_marker setMarkerShape "RECTANGLE";
_marker setMarkerBrush "SOLID";
_marker setMarkerColor _color;
_marker setMarkerSize [_size, _distance];

_marker
