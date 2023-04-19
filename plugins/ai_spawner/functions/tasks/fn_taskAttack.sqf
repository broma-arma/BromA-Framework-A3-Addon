#include "script_component.hpp"
diag_log text format ["%1: %2", _fnc_scriptName, _this];

params [
	"_group",
	"_position",
	"_waypointSettings",
	"_onComplete"
];

if (_waypointSettings isEqualType "") then {
	_waypointSettings = GVAR(waypointSettings) get _waypointSettings;
};

_waypointSettings params [
	"_radius",
	"_searchRadius",
	"_behaviour",
	"_combat",
	"_formation",
	"_speed",
	"_waypointCodeToExecute", // TODO Should this be used?
	"_timeout"
];

if (_onComplete == "") then {
	// TODO Would a "SAD" waypoint be better?
	//      If not, should change to use AIS's taskPatrol or use CBA's taskPatrol for all of AIS, so more consistent behavior.
	//_onComplete = format ["[group this, getPos this, %1] call CBA_fnc_taskPatrol", _searchRadius];

	private _patrolWPSettings = +_waypointSettings;
	_patrolWPSettings set [0, _searchRadius]; // _radius
	_patrolWPSettings set [6, ""]; // _onComplete

	_onComplete = format ["[group this, getPos this, 3, %1] call %2", _patrolWPSettings, QFUNC(taskPatrol)];
};

[_group, _position, _radius, "MOVE", _behaviour, _combat, _speed, _formation, format ["if (local group this) then { %1 };", _onComplete], _timeout] call CBA_fnc_addWaypoint;
// TODO setWaypointForceBehaviour might be beneficial for more of a banzai style charge?
