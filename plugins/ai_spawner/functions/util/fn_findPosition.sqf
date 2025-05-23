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

params ["_center", ["_minRadius", 0], ["_maxRadius", 0], ["_objectRadius", 2], ["_minPlayerRadius", 0], ["_blacklist", ["water"]]];

private _position = _center call BRM_FMK_fnc_getPos;
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
	private _checkPos = [_whitelist, _blacklist] call BIS_fnc_randomPos;

	// position is roughly suitable
	if (_checkPos isFlatEmpty [-1, -1, _maxGradient, _gradientRadius] isEqualTo []) then { continue; };

	// away from other objects
	if (_checkProximity && {!(nearestTerrainObjects [_checkPos, [], _objectRadius, false, true] isEqualTo [])}) then { continue; };

	private _checkPosASL = AGLtoASL _checkPos;

	// not inside something
	if !(lineIntersectsSurfaces [_checkPosASL, _checkPosASL vectorAdd [0, 0, 50], objNull, objNull, false, 1, "GEOM", "NONE"] isEqualTo []) then { continue; };

	_position = _checkPos;
	_position set [2, 0];
	break;
};

_position
