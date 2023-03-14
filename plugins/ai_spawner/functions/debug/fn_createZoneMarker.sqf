params ["_id", "_zone", ["_alpha", 0.25]];

private _area = triggerArea _zone;
_area params ["_areaX", "_areaY", "_angle", "_isRectangle"];

[true, format ["BRM_FMK_AIS_mrk_%1_%2", _id, _zone], _zone,
	["ELLIPSE", "RECTANGLE"] select _isRectangle, nil, nil,
	[[_id] call BRM_FMK_AIS_fnc_getSpawner select AIS_SPAWNER_SIDE, true] call BRM_FMK_AIS_fnc_getSideColor,
	[_areaX, _areaY], nil,
	_angle, _alpha
] call BRM_FMK_fnc_newMarker
