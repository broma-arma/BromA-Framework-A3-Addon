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
diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_id", "_values"];

private _spawner = [_id] call BRM_FMK_AIS_fnc_getSpawner;
{
	_spawner setVariable _x;
} forEach _values;
