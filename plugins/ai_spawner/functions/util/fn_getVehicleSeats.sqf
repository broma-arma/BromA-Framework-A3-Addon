#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_getVehicleSeats

Description:
	Get seats in a vehicle.

Parameters:
	_vehicle - Vehicle or vehicle type [OBJECT/STRING]
	_excludedSeats - Seat types to exclude: "driver", "commander", "gunner", "turret", "cargo" [ARRAY, defaults to nil]

Returns:
	Seats [ARRAY of ARRAY]
		_role - "driver", "commander", "gunner", "turret", "cargo" [STRING]
		_cargoIndex [NUMBER]
		_turretPath [ARRAY]
		_personTurret [BOOLEAN]

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

params ["_vehicle", "_excludedSeats"];

private _seatTypes = ["driver", "commander", "gunner", "turret", "cargo"];
if (!isNil "_excludedSeats") then {
	_seatTypes = _seatTypes - _excludedSeats;
};

private _type = _vehicle;
if (_type isEqualType "") then {
	_vehicle = nil;
} else {
	_type = typeOf _vehicle;
};

private _seats = BRM_FMK_Plugin_AIS_vehicleSeatsCache getOrDefaultCall [_type, {
	private _createVehicle = isNil "_vehicle";

	if (_createVehicle) then {
		// TODO Config based `fullCrew`?
		_vehicle = _type createVehicle [0, 0, 0];
		_vehicle allowDamage false;
	};

	// [[_role, _cargoIndex, _turretPath, _personTurret], ...]
	private _seats = fullCrew [_vehicle, "", true] apply { _x select [1, 4]; };

	if (_createVehicle) then {
		deleteVehicle _vehicle;
	};

	_seats
}, true];

_seats select { _x select 0 in _seatTypes }
