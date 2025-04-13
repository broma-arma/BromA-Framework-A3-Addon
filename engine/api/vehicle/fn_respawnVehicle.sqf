/*
================================================================================

NAME:
    BRM_FMK_fnc_respawnVehicle

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Set a vehicle to respawn.

PARAMETERS:
    0 - Vehicle. (OBJECT)
    1 - (OPTIONAL) code executed on current and respawned vehicles. _this being the vehicle. Default {}. (CODE)
    2 - (OPTIONAL) number of times the vehicle can be respawned. Default -1, unlimited. (NUMBER)
    3 - (OPTIONAL) respawn delay, in seconds. Default -1, 3DEN vehicle respawn delay/description.ext respawnVehicleDelay. (NUMBER)
    4 - (OPTIONAL) delete old wreck after respawn. Default false. (BOOLEAN)

USAGE:
    [this] call BRM_FMK_fnc_respawnVehicle;
    [this, { [_this, "blufor", ["medical", "ammo", "radio", "at"]] call BRM_FMK_fnc_assignCargo; }] call BRM_FMK_fnc_respawnVehicle;
    [this, { [_this, "blufor", ["medical", "ammo", "radio", "at"]] call BRM_FMK_fnc_assignCargo; }, 5] call BRM_FMK_fnc_respawnVehicle;
    [this, { [_this, "blufor", ["medical", "ammo", "radio", "at"]] call BRM_FMK_fnc_assignCargo; }, -1, 5] call BRM_FMK_fnc_respawnVehicle;
    [this, { [_this, "blufor", ["medical", "ammo", "radio", "at"]] call BRM_FMK_fnc_assignCargo; }, -1, 5, true] call BRM_FMK_fnc_respawnVehicle;

RETURNS:
    Nothing.

================================================================================
*/

if (!isServer) exitWith {};

params [
	["_vehicle", objNull, [objNull]],
	["_init", {}, [{}, []]],
	["_respawnCount", -1, [0]],
	["_delay", -1, [0]],
	["_deleteWreck", false, [false]]
];

private _simulation = toLower getText (configOf _vehicle >> "simulation");
if !(_simulation in ["car", "carx", "tank", "tankx", "helicopter", "helicopterx", "helicopterrtd", "airplane", "airplanex", "ship", "shipx", "submarinex"]) exitwith {
	["Vehicle %1 of type ""%2"" has simulation ""%3""", _vehicle, typeOf _vehicle, _simulation] call BIS_fnc_error;
	nil
};

private _args = _vehicle getVariable "BRM_FMK_fnc_respawnVehicle_args";

if (alive _vehicle && isNil "_args") exitWith {
	_vehicle setVariable ["BRM_FMK_fnc_respawnVehicle_args", [_init, _respawnCount, _delay, _deleteWreck]];
	_vehicle setVariable ["BRM_FMK_fnc_respawnVehicle_location", [getPosATL _vehicle, direction _vehicle]];
	_vehicle addMPEventHandler ["MPKilled", {
		if (isServer) then {
			params ["_vehicle"];
			([_vehicle] + (_vehicle getVariable ["BRM_FMK_fnc_respawnVehicle_args", []])) call BRM_FMK_fnc_respawnVehicle;
		};
	}];

	_vehicle call _init;

	nil
};

if (isNil "_args") exitWith {};

private _type = typeOf _vehicle;
private _varName = vehicleVarName _vehicle;
private _uav = getNumber (configOf _vehicle >> "isUAV") > 0 && count crew _vehicle > 0;
private _curators = objectCurators _vehicle;
_vehicle getVariable ["BRM_FMK_fnc_respawnVehicle_location", [getPosATL _vehicle, direction _vehicle]] params ["_pos", "_dir"];

if (_delay < 0) then { _delay = getMissionConfigValue ["respawnVehicleDelay", 0]; };

[{
	params ["_vehicle", "_init", "_respawnCount", "_delay", "_deleteWreck",
		"_type", "_varName", "_uav", "_curators", "_pos", "_dir"
	];

	if (_deleteWreck) then {
		deleteVehicle _vehicle;
	};

	_vehicle = createVehicle [_type, _pos, [], 0, "NONE"];
	_vehicle setDir _dir;
	if (_varName != "") then {
		_vehicle setVehicleVarName _varName;
		missionNamespace setVariable [_varName, _vehicle, true];
	};

	if (_uav) then {
		createVehicleCrew _vehicle;
	};

	{
		_x addCuratorEditableObjects [[_vehicle], _uav];
	} foreach _curators;

	if (_respawnCount > 0) then { _respawnCount = _respawnCount - 1; };
	if (_respawnCount != 0) then {
		[_vehicle, _init, _respawnCount, _delay, _deleteWreck] call BRM_FMK_fnc_respawnVehicle;
	} else {
		_vehicle call _init;
	};
}, [
	_vehicle, _init, _respawnCount, _delay, _deleteWreck,
	_type, _varName, _uav, _curators, _pos, _dir
], _delay] call CBA_fnc_waitAndExecute;

nil
