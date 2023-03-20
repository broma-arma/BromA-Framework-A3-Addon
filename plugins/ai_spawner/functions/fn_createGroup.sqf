diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_spawnPosition", "_groupType", "_side"];

private _group = createGroup [_side, true];

if (_groupType isEqualType "") then {
	_group setVariable ["BRM_FMK_AIS_groupType", _groupType];
	_groupType = BRM_FMK_AIS_groupTypes get _groupType;
} else {
	_group setVariable ["BRM_FMK_AIS_groupType", keys BRM_FMK_AIS_groupTypes select (values BRM_FMK_AIS_groupTypes find _groupType)];
};

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
		//[_group, _groupType, _side, _spawnPosition] spawn BRM_FMK_AIS_fnc_checkBadSpawn;
	};
} forEach _groupType;

_group
