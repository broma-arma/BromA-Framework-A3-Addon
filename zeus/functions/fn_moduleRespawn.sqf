//BRM_FMK_Zeus_fnc_moduleRespawn
params ["_unit"];

//systemChat format ["fn_moduleRespawn: %1", _unit];

if (isNull _unit) exitWith { "Place on an object" call BRM_FMK_Zeus_fnc_message; false };
if !(_unit isKindOf "CAManBase") exitWith { "Object must be infantry" call BRM_FMK_Zeus_fnc_message; false };
if !(isPlayer _unit) exitWith { "Infantry must be a player" call BRM_FMK_Zeus_fnc_message; false };
if !(_unit call BRM_FMK_fnc_alive) exitWith { "Player must be dead" call BRM_FMK_Zeus_fnc_message; false };

[_unit] call BRM_FMK_fnc_respawn;
