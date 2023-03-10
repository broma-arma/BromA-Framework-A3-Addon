params ["_unit","_cache"];

// true - cache, false - uncache
[_unit,(!(_cache))] remoteExec ["enableSimulationGlobal",2];
[_unit,_cache] remoteExec ["hideObjectGlobal",2];

if (!_cache && vehicle _unit == _unit) then {
	_unit setPosATL [((formationPosition _unit) select 0),((formationPosition _unit) select 1),0];
};

_unit setVariable ["AIS_isCached",_cache];
