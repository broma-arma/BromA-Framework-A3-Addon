params ["_vehicleType","_excludedSeats","_vehicle"];

private _seats = [];
private _seatTypes = [
	"driver",
	"commander",
	"gunner",
	"turret",
	"cargo"
];

private _vehicleExists = if (isNil "_vehicle") then {false} else {true};
_seatTypes = if (isNil "_excludedSeats") then {_seatTypes} else {_seatTypes - _excludedSeats};

if (!_vehicleExists) then {
	_vehicle = createVehicle [_vehicleType, [0,0,0], [], 20, "NONE"];
	_vehicle allowDamage false;
};

{
	_seats = _seats + (fullCrew [_vehicle,_x,true]);
} forEach _seatTypes;

if (!_vehicleExists) then {
	deleteVehicle _vehicle;
};

_seats
