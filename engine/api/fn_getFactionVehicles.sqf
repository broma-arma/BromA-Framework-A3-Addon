
params ["_vehicles", "_selected"];

_returnedVehicles = [];
{ _returnedVehicles = _returnedVehicles + (_vehicles select _x) } forEach _selected;
_returnedVehicles
