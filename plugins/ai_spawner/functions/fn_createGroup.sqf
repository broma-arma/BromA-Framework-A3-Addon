params ["_spawnPosition","_groupType","_side"];

private _group = createGroup [_side, true];
private _groupUnits = [];

_group deleteGroupWhenEmpty true;

{
	_x params ["_type","_units"];
	if ( _type == _groupType ) then {
		_groupUnits = _units;
	};
} forEach AIS_groupTypes;

{
	private _classname = if (typeName _x == "ARRAY") then {selectRandom _x} else {_x};

	if (_classname isKindOf "Man") then {
		private _unit = _group createUnit [_classname, _spawnPosition, [], 5, "NONE"];
	} else {

		private _spawnType = "NONE";

		if (_classname isKindOf "Air") then {
			_spawnPosition = [_spawnPosition select 0, _spawnPosition select 1, 100];
			_spawnType = "FLY";
		};

		private _vehicle = createVehicle [_classname, _spawnPosition, [], 20, _spawnType];
		[_vehicle] spawn BRM_FMK_AIS_fnc_garbageCollector;
		[_vehicle,_group] call BRM_FMK_AIS_fnc_createVehicleCrew;
	};

} forEach _groupUnits;

_group
