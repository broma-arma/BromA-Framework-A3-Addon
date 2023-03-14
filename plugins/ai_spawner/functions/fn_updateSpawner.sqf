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
params ["_id", "_values"];

private _spawner = [BRM_FMK_AIS_Spawners, _id] call BIS_fnc_getFromPairs;
{
	_spawner set _x;
} forEach _values;
