#include "script_component.hpp"
diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_position", "_radius", ["_unit", objNull]];

private _distSqr = _radius ^ 2;
(if (isNull _unit) then { allPlayers } else { [_unit] }) findIf {
	private _pos = getPosWorld _x;
	_pos set [2, 0];
	_pos distanceSqr _position < _distSqr
} != -1
