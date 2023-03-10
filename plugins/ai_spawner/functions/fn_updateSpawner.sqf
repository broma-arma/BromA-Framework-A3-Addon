/*
	0- id,
	1- spawnerType,
	2- spawnedGroups,
	3- spawnCount,
	4- spawnLimit,
	5- unitTotal,
	6- groupTotal,
	7- side,
	8- loadout,
	9- cleanup,
	10- debugMarkers,
	11- conditions
	12- reinforcements (ATTACK)
*/
params ["_id","_values"];


{
	if (_id == _x select 0) then {

		private _spawner = _x;
		private _spawnerIndex = _forEachIndex;

		{
			_x params ["_index","_value"];
			_spawner set [_index,_value];
		} forEach _values;

		AIS_Spawners set [_spawnerIndex,_spawner];
	};
} forEach AIS_Spawners;
