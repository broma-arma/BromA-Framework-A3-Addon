#include "script_component.hpp"
if (!isServer) exitWith {
	_this remoteExec [QFUNC(addTime), 2];
};

params ["_time"];

if (_time == 0) exitWith {};

GVAR(countdown) = GVAR(countdown) + _time;

private _action = if (_time > 0) then { "added to" } else { "removed from" };

_time = abs _time;

private _timeUnit = if (_time >= 60) then {
	_time = floor (_time / 60);

	"minute"
} else {
	"second"
};

if (_time != 1) then {
	_timeUnit = _timeUnit + "s";
};

["Timer", [format ["%1 %2 has been %3 the time limit!", _time, _timeUnit, _action]]] remoteExec ["BIS_fnc_showNotification", [0, -2] select isDedicated];
