/*
Open the Multiplayer Garage.

Arguments
	0: Object/Array/String position    - The position of the shown vehicles
		Object - position and direction of object
		Array  - position and optional direction (direction: index 3)
		String - position and direction of Marker

	1: Bool allowExternal              - False to disable load/save (optional, default: true)
	2: Code spawnHandler               - Custom code that is called when player presses OK (optional, default: spawns the selected vehicle near the position)
		Params: [Array position, Number direction, String vehicleClass, String texture, Array animations, Array loadout]
			position: Position that was passed to "Open", converted to Array position
			direction: Direction that was passed to "Open", in position
			vehicleClass: Class name of the selected vehicle
			texture: Variant class name
			animations: Array of animation sources and probability: ["AnimationSource1", 0, "animationSource2", 1]; Probability is 1 if selected, otherwise 0
			loadout: Array of the selected pylon loadouts: [[pylonIndex, pylonPriority, pylonMagazineName, pylonTurret], ...]

	3: String/Array/Code vehicleFilter - Filters the selectable vehicles (optional, default: "all")
		String - predefined filters: "air", "plane", "heli", "land", "car", "tank", "static", "ship", "all". Invalid filter name results in no vehicles being allowed
		Array  - CfgVehicles type names. E.g. ["Motorcycle"], ["Tank", "StaticWeapon"], ["Plane", "Motorcycle"]
		Code   - called with params [Config vehicleClass]. Return true if vehicle is allowed.

	4: Bool allowIncompatiblePylons    - True to allow incompatible weapons on pylons. (optional, default: false)

Examples
	// Garage 20 meters in-front of player, facing same direction as player
	[(player getRelPos [20, 0]) + [getDir player]] call BRM_FMK_MPGarage_fnc_open;

	// Air-only garage on position/direction of helipad object, with no loading/saving.
	[helipad, false, nil, "air"] call BRM_FMK_MPGarage_fnc_open;

	// Garage on marker "Garage", with custom vehicle spawn handler.
	["Garage", nil, {
		params ["_position", "_direction", "_vehicleClass", "_texture", "_animations", "_loadout"];

		systemChat format ["You selected a '%1'!", _vehicleClass];
	}, nil] call BRM_FMK_MPGarage_fnc_open;
*/

#include "../defines.hpp"

params [
	["_position", objNull, [objNull, [], ""]],
	["_allowExternal", true, [true]],
	["_spawnHandler", nil, [{}]],
	["_vehicleFilter", "all", ["", {}]],
	["_allowIncompatiblePylons", false, [true]]
];

if (_position isEqualTo objNull) exitWith {
	["Missing position argument"] call BIS_fnc_error;
};

private _direction = switch (typeName _position) do {
	case "OBJECT": { direction _position };
	case "ARRAY": {
		_position = +_position; // Prevent modifying argument array

		if (count _position > 3) exitWith {
			_position deleteAt 3
		};
		
		0
	};
	case "STRING": { markerDir _position };
};

_position = switch (typeName _position) do {
	case "OBJECT": { position _position };
	case "ARRAY":  { _position };
	case "STRING": { getMarkerPos _position };
};

if (isNil "_spawnHandler") then {
	_spawnHandler = {
		params ["_position", "_direction", "_vehicleClass", "_texture", "_animations", "_loadout"];

		// Create vehicle
		private _vehicle = _vehicleClass createVehicle _position;
		_vehicle setDir _direction;

		// Apply vehicle textures and animations
		[_vehicle, _texture, _animations] call BIS_fnc_initVehicle;

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

		// Create UAV crew
		if (getText (configFile >> "CfgVehicles" >> _vehicleClass >> "vehicleClass") == "Autonomous") then {
			createVehicleCrew _vehicle;
		};
	};
};

if (_vehicleFilter isEqualType "") then {
	_vehicleFilter = switch (toLower _vehicleFilter) do {
		case "air":    { ["Plane", "Helicopter"] };
		case "plane":  { ["Plane"] };
		case "heli":   { ["Helicopter"] };
		case "land":   { ["Car", "Motorcycle", "Tank", "StaticWeapon"] };
		case "car":    { ["Car", "Motorcycle"] };
		case "tank":   { ["Tank"] };
		case "static": { ["StaticWeapon"] };
		case "ship":   { ["Ship"] };
		case "all":    { { true } };
		default        { { false } };
	};
};

if (_vehicleFilter isEqualType []) then {
	_vehicleFilter = _vehicleFilter apply { format ["_configName isKindOf ""%1""", _x] } joinString " || ";
	_vehicleFilter = compile ("params [""_cfgVehicle""]; private _configName = configName _cfgVehicle; " + _vehicleFilter);
};

MPDisplayGarage_config = [_position, _direction, _allowExternal, _vehicleFilter, _spawnHandler, _allowIncompatiblePylons];
(findDisplay getNumber (configFile >> "RscDisplayMission" >> "idd")) createDisplay "MPDisplayGarage";
