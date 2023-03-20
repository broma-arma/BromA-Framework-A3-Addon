diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_id", "_zone"];

private _spawner = [_id] call BRM_FMK_AIS_fnc_getSpawner;

private _groups = _spawner get "groups";

private _totalUnits = 0;
private _uncachedUnits = 0;
{
	{
		if (alive _x) then {
			_totalUnits = _totalUnits + 1;
			if (!isObjectHidden _x) then {
				_uncachedUnits = _uncachedUnits + 1;
			};
		};
	} forEach units (_x select 1);
} forEach _groups;

format ["BRM_FMK_AIS_ico_%1_%2", _id, _zone] setMarkerText format [
	"%1 (%2,%3/%4)",
	_id,
	count _groups,
	_uncachedUnits,
	_totalUnits
];
