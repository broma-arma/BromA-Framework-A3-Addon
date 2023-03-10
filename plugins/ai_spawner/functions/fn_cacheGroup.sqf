params ["_group","_cachingDistances"];

_cachingDistances params ["_infantryDistance","_vehicleDistance"];

private _distance = if (vehicle (leader _group) == (leader _group)) then {_infantryDistance} else {_vehicleDistance};

while {{alive _x} count (units _group) > 0} do {

	private _leader = leader _group;
	private _units = units _group;
	private _targetCheck = if (isMultiplayer) then {playableUnits} else {switchableUnits};
	private _closeUnits = false;

	{
		if ((getPos _leader) distance (getPos _x) <= _distance) then {_closeUnits = true};
	} forEach _targetCheck;

	{
		private _cached = _x getVariable ["AIS_isCached",false];
		private _isCacheable = [_x] call BRM_FMK_AIS_isCacheable;

		if (!(_isCacheable) && _group getVariable ["AIS_groupDeployed",true]) then {
			if (_cached) then {
				[_x,false] call BRM_FMK_AIS_cacheUnit;
			};
		} else {
			// cache units if no players near
			if (!_cached && !_closeUnits) then {
				[_x,true] call BRM_FMK_AIS_cacheUnit;
			};
			// uncache unit if players near
			if (_cached && _closeUnits) then {
				[_x,false] call BRM_FMK_AIS_cacheUnit;
			};
			// update the position of the cached unit (only for infantry)
			/*
			if (_cached && vehicle _x == _x && _x getVariable ["AIS_setCachedPos",true]) then {
				private _position = (formationPosition _x);
				_x setPosATL [(_position select 0),(_position select 1),0];
			};
			*/
		};

	} forEach units _group;

	sleep 1;
};
