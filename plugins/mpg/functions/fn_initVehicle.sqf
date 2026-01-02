#include "../defines.hpp"

params ["_vehicle", "_texture", "_animations", "_loadout"];

if (isNull _vehicle) exitWith {};

// Apply vehicle textures and animations
[_vehicle, _texture, _animations] call BIS_fnc_initVehicle;

if (!isNil "_loadout" && _loadout isEqualType []) then {
	// Remove all pylon weapons.
	private _vehicleTurrets = [[-1]] + allTurrets _vehicle;
	{ private _weapon = _x; { _vehicle removeWeaponTurret [_weapon, _x]; } forEach _vehicleTurrets; } forEach ((getPylonMagazines _vehicle) apply { getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") });

	// Set pylon loadouts
	private _pylonsPriority = [];
	{
		_x params ["_pylonIndex", "_pylonPriority", "_pylonMagazineName", "_pylonTurret"];

		_pylonsPriority set [_pylonIndex - 1, _pylonPriority];

		_vehicle setPylonLoadOut [_pylonIndex, _pylonMagazineName, true, _pylonTurret];
	} forEach _loadout;

	// Set pylon priorities
	_vehicle setPylonsPriority _pylonsPriority;
};

// Create UAV crew
if (getText (configOf _vehicle >> "vehicleClass") == "Autonomous") then {
	createVehicleCrew _vehicle;
};
