
params ["_vehicle", "_loadout", "_side"];

_vehicleInit = _vehicle getVariable ["DACVehicleLoadout", false];

if (!_vehicleInit) then {
    _vehicle setVariable ["DACVehicleLoadout", true, true];

    while {(alive _vehicle)} do {
        {
            if (side _x == _side) then {
                [_x, _loadout] call BRM_fnc_initAI;
            };
        } forEach (crew _vehicle);
        sleep 15;
    };
};
