#include "../defines.hpp"

params ["_vehicle", "_index", ["_autoFocus", true]];

private _vehiclePylons = [
	//[pylonIndex, priority, attachment, turret, selectionName], ...
];

private _cfgPylons = configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "Components" >> "TransportPylonsComponent" >> "Pylons";
if (isClass _cfgPylons) then {
	// Pylon selection names
	private _selectionNames = [];
	{
		if (_x select [0, 6] == "proxy:") then {
			private _s = _x splitString "\";
			(_s select (count _s - 1) splitString ".") params ["_name", "_pylonIndex"];
			private _cfgProxy = configFile >> "CfgNonAIVehicles" >> ("Proxy" + _name);
			if (isClass _cfgProxy && { getText (_cfgProxy >> "simulation") == "pylonpod" }) then {
				_selectionNames set [parseNumber _pylonIndex, _x];
			};
		};
	} forEach (selectionNames _vehicle);

	// Pylon information
	for "_i" from 0 to count _cfgPylons - 1 do {
		private _cfgPylon = _cfgPylons select _i;
		if (count getArray (_cfgPylon >> "hardpoints") > 0) then {
			private _pylonIndex = _i + 1;
			_vehiclePylons pushBack [
				_pylonIndex,
				getNumber (_cfgPylon >> "priority"),
				getText (_cfgPylon >> "attachment"),
				getArray (_cfgPylon >> "turret"),
				_vehicle selectionPosition (_selectionNames select _pylonIndex),
				getNumber (_cfgPylon >> "mirroredMissilePos")
			];
		};
	};

	// Reposition empty selection positions.
	private _yOffset = 0;
	{
		_x params ["_pylonIndex", "_priority", "_attachment", "_turret", "_selectionPos", "_mirrorPylonIndex"];

		if (_selectionPos isEqualTo [0, 0, 0]) then {
			if (_mirrorPylonIndex == 0) then {
				private _mirrors = _vehiclePylons select { _pylonIndex == _x select 5/*mirrorPylonIndex*/ && _x select 4/*selectionPos*/ isEqualTo [0, 0, 0] };
				private _mirrorsCount = count _mirrors + 1;
				private _startXOffset = (_mirrorsCount - 1) * -(0.5 / 2);
				{
					_x params ["_pylonIndex", "_priority", "_attachment", "_turret", "_selectionPos", "_mirrorPylonIndex"];

					_selectionPos set [0, _startXOffset + 0.5 * (_forEachIndex + 1)];
					_selectionPos set [1, _yOffset];
				} forEach _mirrors;
				_selectionPos set [0, _startXOffset/* + 0.5 * 0*/];
				_selectionPos set [1, _yOffset];
				_yOffset = _yOffset - 0.5;
			};
		};
	} forEach _vehiclePylons;
};

_vehiclePylons
