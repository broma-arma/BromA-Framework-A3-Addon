params ["_id","_zone"];

private _spawner = [_id] call BRM_FMK_AIS_fnc_getSpawner;

private _groups =  (_spawner select BRM_FMK_AIS_SPAWNER_GROUPS);
private _totalUnits = 0;
private _uncachedUnits = 0;

{
	_totalUnits = _totalUnits + ({alive _x} count (units (_x select 1)));
	_uncachedUnits = _uncachedUnits + ({alive _x && !(isObjectHidden _x)} count (units (_x select 1)));
} forEach _groups;

(format ["BRM_FMK_AIS_ico_%1_%2",_id,_zone]) setMarkerText format [
	"%1 (%2,%3/%4)",
	_id,
	count _groups,
	_uncachedUnits,
	_totalUnits
];
