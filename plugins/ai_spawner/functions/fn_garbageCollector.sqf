#include "script_component.hpp"
diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_unit"];

if (_unit isKindOf "Man") then {
	GVAR(garbageCollector) params ["_minTime", "_playerRadius", "_maxTime"];

	private _weaponHolderTypes = [
		"WeaponHolderSimulated",
		"WeaponHolder",
		"GroundWeaponHolder_Scripted",
		"WeaponHolderSimulated_Scripted",
		"Weapon_Empty"
	];

	private _weaponHolders = nearestObjects [_unit, _weaponHolderTypes, 20];

	if !(_unit getVariable [QGVAR(isCached), false]) then {
		[_unit, BRM_FMK_AIS_garbageCollector] call FUNC(garbageCollectorCheck);
	};

	hideBody _unit;
	{deleteVehicle _x;} forEach _weaponHolders;

	sleep 5; // let the body hit the floor

	deleteVehicle _unit; // TODO This should be done by hideBody
} else {
	[_unit] spawn {
		params ["_vehicle"];

		GVAR(garbageCollectorVehicle) params ["_minTime", "_playerRadius", "_maxTime"];

		private _crew = units group driver _vehicle;
		while {alive _vehicle} do {
			if ({ alive _x } count crew _vehicle == 0) exitWith {};
		};

		[_vehicle, GVAR(garbageCollector)] call FUNC(garbageCollectorCheck);

		deleteVehicle _vehicle;

		{
			_x setDamage 1;
		} forEach _crew;
	};
};
