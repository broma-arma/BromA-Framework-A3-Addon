params ["_type"];

[BRM_FMK_AIS_groupTypes, _type] call BIS_fnc_getFromPairs findIf {
	if (_x isEqualType []) then { // random unit array
		_x findIf { _x isKindOf "LandVehicle" } != -1
	} else {
		_x isKindOf "LandVehicle"
	}
} != -1
