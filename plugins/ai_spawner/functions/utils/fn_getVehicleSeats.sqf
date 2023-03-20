diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_vehicleType", ["_excludedSeats", [], [[]]], "_vehicle"];

private _seats = [];
private _seatTypes = [
	"driver",
	"commander",
	"gunner",
	"turret",
	"cargo"
] - _excludedSeats;

BRM_FMK_AIS_vehicleSeatsCache getOrDefaultCall [[_vehicleType] + _seatTypes, {
	private _vehicleExists = !isNil "_vehicle";

	if (!_vehicleExists) then {
		// TODO Config based `fullCrew`?
		_vehicle = _vehicleType createVehicle [0, 0, 0];
		_vehicle allowDamage false;
	};

	{
		_seats append fullCrew [_vehicle, _x, true];
	} forEach _seatTypes;

	if (!_vehicleExists) then {
		deleteVehicle _vehicle;
	};

	_seats
}, true]
