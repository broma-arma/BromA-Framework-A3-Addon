params ["_spawnPosition", "_groupType", "_side"];

private _group = createGroup [_side, true];

_group deleteGroupWhenEmpty true; // TODO Were there issues with just using the deleteWhenEmpty parameter in `createGroup`?

private _groupUnits = [BRM_FMK_AIS_groupTypes, _groupType, []] call BIS_fnc_getFromPairs;

{
	// TODO Support selectRandomWeighted?
	private _classname = if (_x isEqualType []) then {selectRandom _x} else {_x};

	if (_classname isKindOf "Man") then {
		_group createUnit [_classname, _spawnPosition, [], 0, "NONE"];
	} else {
		private _spawnType = "NONE";
		if (_classname isKindOf "Air") then {
			_spawnPosition set [2, [100, 500] select (_classname isKindOf "Plane")];
			_spawnType = "FLY"; // TODO This might conflict with the specified altitude or it might be irrelevant.
		};

		private _vehicle = createVehicle [_classname, _spawnPosition, [], 0, _spawnType];
		[_vehicle] spawn BRM_FMK_AIS_fnc_garbageCollector;
		[_vehicle, _group] call BRM_FMK_AIS_fnc_createVehicleCrew; // TODO Vehicle crew should be in a seperate group?
	};
} forEach _groupUnits;

_group
