params [
	"_group",
	"_attackPosition",
	"_waypointSettings",
	"_eventWaypoint"
];

_waypointSettings = (((BRM_FMK_AIS_waypointSettings select {_x select 0 == _waypointSettings}) select 0) select 1);

_waypointSettings params [
	"_waypointRadius",
	"_waypointSearchRadius",
	"_waypointBehaviour",
	"_waypointCombatMode",
	"_waypointFormation",
	"_waypointSpeed",
	"_waypointCodeToExecute",
	"_waypointTimeout"
];

_eventWaypoint = if (_eventWaypoint == "") then {
	format ["[this, getPos (leader this), %1] call CBA_fnc_taskPatrol",_waypointSearchRadius];
} else {
	_eventWaypoint
};

[
	_group,
	_attackPosition,
	_waypointRadius,
	"MOVE",
	_waypointBehaviour,
	_waypointCombatMode,
	_waypointSpeed,
	_waypointFormation,
	_eventWaypoint,
	_waypointTimeout
] call CBA_fnc_addWaypoint;
