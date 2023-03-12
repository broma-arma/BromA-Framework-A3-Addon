params ["_type"];

private _groupType = [_type,AIS_groupTypes] call BRM_FMK_AIS_fnc_getById;
private _hasVehicle = false;

// only check for land vehicle
{
	// if it's random  unit array
	_units = if (typeName _x != "ARRAY") then {[_x]} else {_x};

	{
		if (_x isKindOf "LandVehicle") then {
			_hasVehicle = true;
		};
	} forEach _units;
} forEach (_groupType select 1);

_hasVehicle;
