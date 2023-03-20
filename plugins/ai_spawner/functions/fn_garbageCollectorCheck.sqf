// delete the object after the minimum time when no players nearby, otherwise delete it after _maxTime has elapsed

diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_object", "_settings"];

_settings params ["_minTime", "_playerRadius", "_maxTime"];

private _timeOfDeath = time;

waitUntil {
	{ isPlayer _x } count (_object nearEntities _playerRadius) == 0
	|| time > _timeOfDeath + _maxTime // TODO Remove or add body/wreck limit before allowing this
};

if (time <= _timeOfDeath + _maxTime) then {
	sleep _minTime;
};
