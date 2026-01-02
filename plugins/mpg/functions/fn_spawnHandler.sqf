// BRM_FMK_Plugin_MPGarage_fnc_spawnHandler
#include "../defines.hpp"

params ["_position", "_direction", "_vehicleClass", "_texture", "_animations", "_loadout"];

// Create vehicle
private _vehicle =  createVehicle [_vehicleClass, _position, [], 0];
_vehicle setDir _direction;

_vehicle
