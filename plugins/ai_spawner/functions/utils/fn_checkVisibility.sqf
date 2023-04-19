#include "script_component.hpp"
diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_position", "_radius"];

private _visible = false;
private _positionASL = +_position;
_positionASL set [2, getTerrainHeightASL _position];
private _positionASLHigh = _positionASL vectorAdd [0, 0, 1.5];

{
	// TODO Use checkVisibility instead of lineIntersectsSurfaces?
	if (side _x != sideLogic && ((_x getRelDir _positionASLHigh) + 90) % 360 < 180) exitWith {
		private _eyePos = eyePos _x;
		if (lineIntersectsSurfaces [_eyePos, _positionASL, _x] isEqualTo [] || lineIntersectsSurfaces [_eyePos, _positionASLHigh, _x] isEqualTo []) then {
			_visible = true; // is visible by players
		};
	};

	// TODO This shouldn't be here.
	if ([_position, _radius, _x] call FUNC(checkNearPlayers)) exitWith {
		_visible = true;
	};
} forEach allPlayers;

_visible
