diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_type"];

if (_type isEqualType "") then {
	_type = BRM_FMK_AIS_groupTypes get _type;
};

_type findIf {
	if (_x isEqualType []) then { // random unit array
		_x findIf { _x isKindOf "LandVehicle" } != -1
	} else {
		_x isKindOf "LandVehicle"
	}
} != -1
