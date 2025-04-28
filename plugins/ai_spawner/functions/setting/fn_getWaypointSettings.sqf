#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_getWaypointSettings

Description:
	Get waypoint settings.

Parameters:
	_settings - Setting ID [STRING/ARRAY]

Returns:
	Settings, nil if setting doesn't exist [ARRAY/NIL]
		_radius - Radius [NUMBER]
		_searchRadius - Search Radius (only for attack) [NUMBER]
		_behaviour - Switches the unit behaviour when the waypoint becomes active: "UNCHANGED", "CARELESS", "SAFE", "AWARE", "COMBAT", "STEALTH". Force the behavior of a waypoint, disables AUTOCOMBAT, by prefixing the behaviour with "FORCE_", for example "FORCE_COMBAT". [STRING]
		_combat - Changes a group's combat mode when the waypoint becomes active: "NO CHANGE", "BLUE", "GREEN", "WHITE", "YELLOW", "RED" [STRING]
		_formation - Switches the group formation when the waypoint becomes active: "NO CHANGE", "COLUMN", "STAG COLUMN", "WEDGE", "ECH LEFT", "ECH RIGHT", "VEE", "LINE", "FILE", "DIAMOND" [STRING]
		_speed - Switches the group speed mode when the waypoint becomes active: "UNCHANGED", "LIMITED", "NORMAL", "FULL" [STRING]
		_onComplete - Statement expression executed when a waypoint is done [STRING]
		_timeout - Defines the time between condition satisfaction and waypoint finish (randomly from min to max, with an average value mid). [ARRAY]
			_min - Min [NUMBER]
			_mid - Mid [NUMBER]
			_max - Max [NUMBER]
		_completionRadius - Completion radius of the waypoint (unit/vehicle's 'precision' will override if larger) [NUMBER]

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

params ["_settings"];

// [ID, [Waypoint Radius, Waypoint Search Radius (only for attack), Waypoint Behaviour, Waypoint Combat Mode, Waypoint formation, Waypoint Speed, Waypoint Code, Waypoint Timeout [min, mid, max]]
//["SAFE", [10, 150, "SAFE", "YELLOW", "FILE", "LIMITED", "", [0, 0, 0]]],

if (_settings isEqualType []) exitWith { _settings };

_settings = BRM_FMK_Plugin_AIS_waypointSettings get _settings;

if (isNil "_settings") exitWith { nil };

_settings params [
	["_radius", 0, [0]],
	["_searchRadius", -1, [0]],
	["_behaviour", "UNCHANGED", [""]],
	["_combat", "NO CHANGE", [""]],
	["_formation", "NO CHANGE", [""]],
	["_speed", "UNCHANGED", [""]],
	["_onComplete", "", [""]],
	["_timeout", [0,0,0], [[]], 3],
	["_compRadius", 0, [0]]
];

private _forceBehaviour = _behaviour select [0, 6] == "FORCE_";
if (_forceBehaviour) then {
	_behaviour = _behaviour select [6];
};

if (_searchRadius < 0) then {
	_searchRadius = _radius;
};

[
	_radius,
	_searchRadius,
	_behaviour,
	_forceBehaviour,
	_combat,
	_formation,
	_speed,
	_onComplete,
	_timeout,
	_compRadius
]
