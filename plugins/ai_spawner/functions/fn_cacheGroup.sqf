#include "script_component.hpp"
diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_group", ["_cachingDistances", [GVAR(infantryCacheDistance), GVAR(vehicleCacheDistance)]]];

private _distanceSqr = (_cachingDistances select !isNull objectParent leader _group) ^ 2;

private _loop = true;
while {_loop} do {
	private _leader = leader _group;
	// TODO 2d distance?
	private _cacheUnits = (if (isMultiplayer) then {playableUnits} else {switchableUnits}) findIf { // Don't `select` units
		_leader distanceSqr _x <= _distanceSqr
	} == -1;

	// TODO Add cooldown for re-caching, so don't end up repeatedly caching and recaching a group when players are on edge of cache distance?

	_loop = false;
	{
		if (alive _x) then {
			_loop = true;

			private _cached = _x getVariable [QGVAR(isCached), false];
			private _isCacheable = [_x] call FUNC(isCacheable);

			// TODO This seems problematic
			if (!_isCacheable && _group getVariable [QGVAR(groupDeployed), true]) then {
				if (_cached) then { // TODO ~~This shouldn't be possible?~~ Used by defense spawner for *delayed* spawning.
					[_x, false] call FUNC(cacheUnit);
				};
			} else {
				if (_cached) then {
					// uncache unit if players near
					if (!_cacheUnits) then {
						[_x, false] call FUNC(cacheUnit);
					};
					// update the position of the cached unit (only for infantry)
					/*
					if (isNull objectParent _x && _x getVariable [QGVAR(setCachedPos), true]) then {
						private _position = formationPosition _x;
						_position set [2, 0];
						_x setPosATL _position; // TODO ATL would result in unit being placed inside rocks?
					};
					*/
				} else {
					if (_cacheUnits) then { // cache units if no players near
						[_x, true] call FUNC(cacheUnit);
					};
				}
			};
		};
	} forEach units _group;

	// TODO Increase delay?
	sleep 1;
};
