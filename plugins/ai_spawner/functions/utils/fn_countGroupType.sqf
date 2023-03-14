params ["_groupType"];

private _unitCount = 0;

{
	if (_x isEqualType []) then {
		_unitCount = _unitCount selectMax _x apply {
			if (_x isKindOf "Man") then {
				1
			} else {
				count ([_x, ["cargo", "turret"]] call BRM_FMK_AIS_fnc_getVehicleSeats)
			}
		};
	} else {
		if (_x isKindOf "Man") then {
			_unitCount = _unitCount + 1;
		} else {
			_unitCount = _unitCount + (count ([_x, ["cargo", "turret"]] call BRM_FMK_AIS_fnc_getVehicleSeats));
		};
	};
} forEach [BRM_FMK_AIS_groupTypes, _groupType, []] call BIS_fnc_getFromPairs;

_unitCount
