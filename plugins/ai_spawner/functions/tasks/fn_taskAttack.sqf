params [
	"_group",
	"_position",
	"_waypointSettings",
	"_onComplete"
];

[BRM_FMK_AIS_waypointSettings, _waypointSettings] call BIS_fnc_getFromPairs params [
	"_radius",
	"_searchRadius",
	"_behaviour",
	"_combat",
	"_formation",
	"_speed",
	"_waypointCodeToExecute",
	"_timeout"
];

if (_onComplete == "") then {
	// TODO Would a "SAD" waypoint be better?
	//      If not, should change to use AIS's taskPatrol or use CBA's taskPatrol for all of AIS, so more consistent behavior.
	_onComplete = format ["[group this, getPos this, %1] call CBA_fnc_taskPatrol", _searchRadius];
};

[_group, _position, _radius, "MOVE", _behaviour, _combat, _speed, _formation, _onComplete, _timeout] call CBA_fnc_addWaypoint;
// TODO setWaypointForceBehaviour might be beneficial for more of a banzai style charge?
