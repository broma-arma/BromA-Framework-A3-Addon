if (!isServer) exitWith {
	_this remoteExec ["BRM_FMK_TimeLimit_fnc_addTime", 2];
};

params ["_time"];

if (_time == 0) exitWith {};

BrmFmk_TimeLimit_countdown = BrmFmk_TimeLimit_countdown + _time;

private _action = ["removed from", "added to"] select (_time > 0);

_time = abs _time;

private _timeUnit = "second";
if (_time >= 60) then {
	_time = floor (_time / 60);
	_timeUnit = "minute";
};

if (_time != 1) then {
	_timeUnit = _timeUnit + "s";
};

["Timer", [format ["%1 %2 has been %3 the time limit!", _time, _timeUnit, _action]]] remoteExec ["BIS_fnc_showNotification", [0, -2] select isDedicated];
