params ["_unit"];

private _unitVehicle = (vehicle _unit);

private _cacheable = if (_unitVehicle isKindOf "StaticWeapon" && gunner (_unitVehicle) == _unit) then {
	false
} else {
	if (_unit != _unitVehicle && (driver _unitVehicle) == _unit) then {
		false
	} else {
		if (_unit == _unitVehicle && leader (group _unit) == _unit) then {
			false
		} else {
			true
		};
	}
};

_cacheable
