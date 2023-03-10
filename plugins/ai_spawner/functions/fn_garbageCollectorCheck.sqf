params ["_object","_settings"];

_settings params ["_minTime","_playerRadius","_maxTime"];

private _timeOfDeath = time;

waitUntil{
	(({isPlayer _x} count (_object nearEntities _playerRadius) == 0) || (time > _timeOfDeath+_maxTime))
};

/*
if the object has no players nearby delete it after the minimum time,
otherwise delete it right away when there's no players nearby
*/

if !(time > _timeOfDeath+_maxTime) then {
	sleep _minTime;
};
