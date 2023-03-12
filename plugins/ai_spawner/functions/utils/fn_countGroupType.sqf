params ["_groupType"];

private _unitCount = 0;

{
	_x params ["_type","_units"];

	if (_type == _groupType) exitWith {
		{
			private _classname = if (typeName _x == "ARRAY") then {_x select 0} else {_x};

			if (_classname isKindOf "Man") then {
				_unitCount = _unitCount + 1;
			} else {
				_unitCount = _unitCount + (count ([_classname,["cargo","turret"]] call BRM_FMK_AIS_fnc_getVehicleSeats));
			};
		} forEach _units;
	};
} forEach AIS_groupTypes;

_unitCount
