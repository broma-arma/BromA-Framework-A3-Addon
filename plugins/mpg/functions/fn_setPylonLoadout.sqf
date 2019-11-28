#include "../defines.hpp"

private _params = params [
	["_vehicle", nil, [objNull]],
	["_pylon", nil, ["", 0]],
	["_magazine", nil, [""]],
	["_forced", false, [false]],
	["_turret", [], [[]]]
];

if (isNil "_vehicle") exitWith { ["setPylonLoadOut._vehicle is nil"] call BIS_fnc_error; };
if (isNil "_pylon") exitWith { ["setPylonLoadOut._pylon is nil"] call BIS_fnc_error; };
if (isNil "_magazine") exitWith { ["setPylonLoadOut._magazine is nil"] call BIS_fnc_error; };

if (_pylon isEqualType "") then {
	// Pylon name to index
	private _cfgPylons = configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "Components" >> "TransportPylonsComponent" >> "Pylons";
	for "_i" from 0 to count _cfgPylons - 1 do {
		if (_pylon == configName (_cfgPylons select _i)) exitWith {
			_pylon = _i + 1;
		};
	};
};
if (_pylon isEqualType "") exitWith { [format ["setPylonLoadOut: pylon %1 not found", _pylon]] call BIS_fnc_error; };

// Remove previous magazine's weapon, if unused.
private _pylonMagazines = getPylonMagazines _vehicle;
private _removePylonMagazine = _pylonMagazines select (_pylon - 1);
if (_removePylonMagazine != "" && { _x == _removePylonMagazine } count _pylonMagazines < 2) then {
	{ _vehicle removeWeaponTurret [getText (configFile >> "CfgMagazines" >> _removePylonMagazine >> "pylonWeapon"), _x]; } forEach ([[-1]] + allTurrets _vehicle);
};

_vehicle setPylonLoadOut [_pylon, _magazine, _forced, _turret];
