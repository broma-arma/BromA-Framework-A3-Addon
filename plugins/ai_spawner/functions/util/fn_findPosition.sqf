#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_findPosition

Description:
	Find a suitable spawn position.

Parameters:
	_center - Center position to search at [OBJECT/TRIGGER/GROUP/MARKER/LOCATION/POSITION/WAYPOINT/ARRAY]
	_minRadius - Minimum radius to search [NUMBER, defaults to 0]
	_maxRadius - Maximum radius to search, > 0 will override using a trigger's area [NUMBER, defaults to 0]
	_objectRadius - Range from center position to search for objects [NUMBER, defaults to 2]
	_minPlayerRadius - Minimum radius player's must be from the position [NUMBER, defaults to 0]
	_blacklist - Blacklisted areas [ARRAY, defaults to ["water"]]
		OBJECT - trigger
		STRING - marker
		STRING - special tags: 
			"water" - exclude water
			"ground" - exclude land
		ARRAY - [center, radius] or [center, [a, b, angle, rect]]
		LOCATION - location

Returns:
	Spawn position, or empty array if failed [ARRAY]

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

#define MAX_ATTEMPTS 100
#define TRACE_LIFETIME 30

params ["_center", ["_minRadius", 0], ["_maxRadius", 0], ["_objectRadius", 2], ["_minPlayerRadius", 0], ["_blacklist", ["water"]]];

private _position = _center call BRM_FMK_fnc_getPos;

private "_traceIcon";
if (BRM_FMK_Plugin_AIS_trace) then {
	_traceIcon = [time + TRACE_LIFETIME, ["\a3\ui_f\data\map\markers\military\dot_ca.paa", [1, 1, 1, 0.5], ASLToAGL _position, 0.5, 0.5, 0, "findPosition", 2, 0.05, "PuristaMedium"]];
	BRM_FMK_Plugin_AIS_traceIcons pushBack _traceIcon;
};

private _whitelist = [if (_maxRadius <= 0 && { _center isEqualType objNull && { _center isKindOf "EmptyDetector" } }) then {
	_center
} else {
	[_position, _maxRadius]
}];
if (_minRadius > 0) then {
	_blacklist pushBack [_position, _minRadius];
};

if (_minPlayerRadius > 0) then {
	{
		_blacklist pushBack [getPosASL _x select [0, 2], _minPlayerRadius];
	} forEach allPlayers;
};

_position = [];

// BIS_fnc_findSafePos
// TODO Use findEmptyPosition?
private _maxGradient = 0; // 0.05
private _checkProximity = _objectRadius > 0;
private _gradientRadius = 1 max _objectRadius * 0.1;

for "_i" from 1 to MAX_ATTEMPTS do {
	private _checkPos = [_whitelist, _blacklist] call BIS_fnc_randomPos; // AGL

	private "_tracePosIcon";
	if (BRM_FMK_Plugin_AIS_trace) then {
		_tracePosIcon = [time + TRACE_LIFETIME, ["\a3\ui_f\data\map\markers\military\dot_ca.paa", [1, 1, 0, 0.5], _checkPos, 0.5, 0.5, 0, str _i, 2, 0.05, "PuristaMedium"]];
		BRM_FMK_Plugin_AIS_traceIcons pushBack _tracePosIcon;
	};

	// position is roughly suitable
	if (_checkPos isFlatEmpty [-1, -1, _maxGradient, _gradientRadius] isEqualTo []) then {
		if (BRM_FMK_Plugin_AIS_trace) then {
			_tracePosIcon set [0, time + TRACE_LIFETIME];
			_tracePosIcon select 1 set [1, [1, 0, 0, 0.5]];
			_tracePosIcon select 1 set [6, "G"]; // Ground
		};
		continue;
	};

	// away from other objects
	if (_checkProximity && {!(nearestTerrainObjects [_checkPos, [], _objectRadius, false, true] isEqualTo [])}) then {
		if (BRM_FMK_Plugin_AIS_trace) then {
			_tracePosIcon set [0, time + TRACE_LIFETIME];
			_tracePosIcon select 1 set [1, [1, 0, 0, 0.5]];
			_tracePosIcon select 1 set [6, "O"]; // Object
		};
		continue;
	};

	private _checkPosASL = AGLtoASL _checkPos;

	// not inside something
	if (lineIntersectsSurfaces [_checkPosASL, _checkPosASL vectorAdd [0, 0, 50], objNull, objNull, false, 1, "GEOM", "NONE"] isNotEqualTo []) then {
		if (BRM_FMK_Plugin_AIS_trace) then {
			_tracePosIcon set [0, time + TRACE_LIFETIME];
			_tracePosIcon select 1 set [1, [1, 0, 0, 0.5]];
			_tracePosIcon select 1 set [6, "R"]; // Roof
		};
		continue;
	};

	_position = _checkPos;
	_position set [2, 0];
	break;
};

if (BRM_FMK_Plugin_AIS_trace && _position isEqualTo []) then {
	_traceIcon set [0, time + TRACE_LIFETIME];
	_traceIcon select 1 set [6, "findPosition failed"];
};

_position
