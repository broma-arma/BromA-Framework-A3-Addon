params ["_group", "_zone", "_waypointCount", "_waypointSettings"];

[BRM_FMK_AIS_waypointSettings, _waypointSettings] call BIS_fnc_getFromPairs params [
	"_radius",
	"_searchRadius",
	"_behaviour",
	"_combat",
	"_formation",
	"_speed",
	"_onComplete",
	"_timeout"
];

private _firstPosition = [];
private _lastPosition = [];
for "_i" from 1 to _waypointCount do {
	private _position = [_zone, 0, _zone, [nil, 10] select (!isNull objectParent leader _group)] call BRM_FMK_AIS_fnc_findPosition;

	if (_i == _waypointCount - 1) then {
		_firstPosition = _position;
	};
	if (_i == _waypointCount) then {
		if (_firstPosition isEqualTo []) then {
			_firstPosition = _position vectorAdd [0, -1, 0];
		};
		_lastPosition = _position;
	};

	[_group, _position, _radius, "MOVE", _behaviour, _combat, _speed, _formation, _onComplete, _timeout] call CBA_fnc_addWaypoint;
};

if (_waypointCount > 0) then {
	private _diff = _lastPosition vectorDiff _firstPosition;
	[_group, vectorNormalized _diff vectorMultiply vectorMagnitude _diff, _radius, "CYCLE", _behaviour, _combat, _speed, _formation, _onComplete, _timeout] call CBA_fnc_addWaypoint;
};
