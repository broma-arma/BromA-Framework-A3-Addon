diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_type"];

private _unitCount = 0;

if (_type isEqualType "") then {
	_type = BRM_FMK_AIS_groupTypes get _type;
};

{
	if (_x isEqualType []) then {
		_unitCount = selectMax (_x apply {
			if (_x isKindOf "Man") then {
				1
			} else {
				count ([_x, ["cargo", "turret"]] call BRM_FMK_AIS_fnc_getVehicleSeats)
			}
		});
	} else {
		if (_x isKindOf "Man") then {
			_unitCount = _unitCount + 1;
		} else {
			_unitCount = _unitCount + (count ([_x, ["cargo", "turret"]] call BRM_FMK_AIS_fnc_getVehicleSeats));
		};
	};
} forEach _type;

_unitCount
