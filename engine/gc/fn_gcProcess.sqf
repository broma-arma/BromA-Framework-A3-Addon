/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_gcProcess

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Processes a garbage collection queue.
    Garbage is cleaned up if it is further away than `distance` from a player and after `time`, if `limit` is reached, otherwise `maxTime`.
    `distance` is ignored if `maxLimit` is reached.

PARAMETERS:
    0 - _queue			Queue to process. (ARRAY)
    1 - _fnc_delete		Function called to cleanup an object in the queue. _this is the object. (CODE)
    2 - _distanceSqr	Distance squared, in meters, that a player has to be from an object for it to be cleaned up. (NUMBER)
    3 - _limit			Limit of queue size needed for objects to be cleaned up after time. (NUMBER)
    4 - _minTime		Time, in seconds, for objects to be cleaned up, when queue size is greater than limit. (NUMBER)
    5 - _maxLimit		Maximum limit of queue size for distance to be ignored. (NUMBER)
    6 - _maxTime		Time, in seconds, for objects to be cleaned up, when queue size is less than or equal to limit. (NUMBER)

USAGE:
    call BRM_FMK_Engine_fnc_gcProcess;

RETURNS:
    Nothing.

================================================================================
*/

params ["_queue", "_fnc_delete", "_distanceSqr", "_limit", "_minTime", "_maxLimit", "_maxTime"];

private _time = time;
private _i = 0;
private _count = count _queue;
while { _i < _count } do {
	(_queue select _i) params ["_t", "_object"];

	if (isNil "_object" || { isNull _object }) then {
		_queue deleteAt _i;
		_count = _count - 1;
		continue;
	};

	private _timeLimit = _maxTime;
	private _distanceSqr = _distanceSqr;
	if (_limit > 0 && { _count > _limit }) then {
		_timeLimit = _minTime;
		if (_distanceSqr > 0 && { _count > _maxLimit }) then {
			_distanceSqr = 0;
		};
	};
	if (_time - _t < _timeLimit) then { break; };

	if (_distanceSqr <= 0 || { allPlayers findIf { _x call BRM_FMK_fnc_alive && { !(_x getVariable ["ACE_isUnconscious", false]) && { _x distanceSqr _object < _distanceSqr } } } == -1 }) then {
		_object call _fnc_delete;

		_queue deleteAt _i;
		_count = _count - 1;
	} else {
		_i = _i + 1
	};
};
