// BRM_FMK_Plugin_MPGarage_fnc_convertPosition
#include "../defines.hpp"

params ["_position", "_type"];

//surfaceIsWater and Z Position: 0
// Helicopters and planes: ATL
// !canFloat: AGLS (ATL variant only)
// canFloat: ASLW
//> setVehiclePosition
//> If position is in water and the vehicle can float, it is placed on water surface, otherwise it is placed on the ground, even if the ground is under water.
//> If roof surfaces support walking, units will be placed on roofs if such position is given.
//Simulation types ignore roofs: "helicopter", "helicopterx", "helicopterrtd", "airplane", "airplanex"
private _cfg = configFile >> "CfgVehicles" >> _type;
private _canFloat = if (toLowerANSI getText (_cfg >> "simulation") in ["helicopter", "helicopterx", "helicopterrtd", "airplane", "airplanex"]) then {
	-1
} else {
	getNumber (_cfg >> "canFloat")
};

if (isNil { _position select 2 }) then {
	//ATL + surface to ...
	private _surfaceASL = (_position select [0, 2]) + [getTerrainHeightASL _position max 0];
	private _surface = lineIntersectsSurfaces [_surfaceASL vectorAdd [0, 0, 100], _surfaceASL, objNull, objNull, true, 1, "ROADWAY", "NONE", true] param [0, []];
	if (_canFloat == 0) then { // AGLS (ATL variant only)
		if (_surface param [0, []] isEqualTo []) then {
			ASLToATL _surfaceASL
		} else {
			(_surfaceASL select [0, 2]) + [0]
		}
	} else {
		_surface = _surface param [0, _surfaceASL];
		if (_canFloat == -1) then { // ATL
			ASLToATL _surface
		} else { // AGL
			if (toLowerANSI getText (_cfg >> "simulation") in ["ship", "shipx", "submarinex", "hovercraftx"]) then {
				ASLToAGL _surface
			} else {
				_surface = ASLToAGL _surface;
				if (surfaceIsWater _surface) then { // Quick fix
					_surface = _surface vectorAdd [0, 0, 1.5];
				};
				_surface
			}
		}
	}
} else {
	//ATL to ...
	switch (_canFloat) do {
		case -1: { _position }; // ATL
		case 0: { // AGLS (ATL variant only)
			private _posASL = (_position select [0, 2]) + [getTerrainHeightASL _position max 0];
			private _surfaceASL = lineIntersectsSurfaces [_posASL vectorAdd [0, 0, 100], _posASL, objNull, objNull, true, 1, "ROADWAY", "NONE", true] param [0, []] param [0, []];
			if (_surfaceASL isEqualTo []) then {
				_position
			} else {
				(_posASL select [0, 2]) + [ATLToASL _position vectorDiff _surfaceASL select 2]
			}
		};
		case 1; // AGL
		default { ASLToAGL ATLToASL _position };
	}
}
