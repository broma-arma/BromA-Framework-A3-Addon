params ["_unit"];

if (_unit isKindOf "Man") then {

	AIS_garbageCollector params ["_minTime","_playerRadius","_maxTime"];

	private _weaponHolderTypes = [
		"WeaponHolderSimulated",
		"WeaponHolder",
		"GroundWeaponHolder_Scripted",
		"WeaponHolderSimulated_Scripted",
		"Weapon_Empty"
	];

	private _weaponHolders = nearestObjects [_unit,_weaponHolderTypes,20];

	if (!(_unit getVariable ["AIS_isCached",false])) then {
		[_unit,AIS_garbageCollector] call BRM_FMK_AIS_fnc_garbageCollectorCheck;
	};

	hideBody _unit;
	{deleteVehicle _x;} forEach _weaponHolders;

	sleep 5; // let the body hit the floor

	deleteVehicle _unit;

} else {
	[_unit] spawn {
		params ["_vehicle"];

		AIS_garbageCollectorVehicle params ["_minTime","_playerRadius","_maxTime"];

		private _crew = units (group (driver _vehicle));

		while {alive _vehicle} do {
			if ({alive _x } count (crew _vehicle) == 0) exitWith {};
		};

		[_vehicle,AIS_garbageCollector] call BRM_FMK_AIS_fnc_garbageCollectorCheck;

		deleteVehicle _vehicle;

		{
			_x setDamage 1;
		} forEach _crew;
	};
};
