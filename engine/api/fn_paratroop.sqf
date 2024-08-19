/*
================================================================================

NAME:
    BRM_FMK_fnc_paratroop

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Paratroop synchronized or all, if no synchronized, players from a plane at plane's first and only waypoint and deletes plane. Player's should not be placed in the plane.

PARAMETERS:
    0 - Vehicle. (OBJECT)
    1 - (OPTIONAL) Static line. If true, causes player parachute to be automatically deployed shortly after leaving aircraft. Default true (BOOLEAN)
    2 - (OPTIONAL) Parachute backpack classname. Default "B_Parachute" (STRING)
    3 - (OPTIONAL) Internal use. Default -1 (NUMBER)

USAGE:
    this call BRM_FMK_fnc_paratroop;
    [this, false] call BRM_FMK_fnc_halo; // Manual parachute deployment

RETURNS:
    Nothing.

================================================================================
*/

params [
	["_vehicle", objNull, [objNull]],
	["_staticLine", true, [true]],
	["_backpack", "B_Parachute", [""]],
	["_action", -1, [0]]
];

if (isNull _vehicle || { !([hasInterface, isServer] select (_action != 1)) }) exitWith {};

if (_action != -1) exitWith {
	switch (_action) do {
		case 0: {
			[_vehicle, _staticLine, _backpack] spawn {
				params ["_vehicle", "_staticLine", "_backpack"];
				{
					if (isPlayer _x) then {
						[_vehicle, _staticLine, _backpack, 1] remoteExec ["BRM_FMK_fnc_paratroop", _x];
						sleep 1;
					};
				} forEach crew _vehicle;
			};
		};
		case 1: {
			[_vehicle, _staticLine, _backpack] spawn {
				params ["_vehicle", "_staticLine", "_backpack"];

				player disableCollisionWith _vehicle;

				unassignVehicle player;
				moveOut player;

				[player, -1, _backpack, [-1, -2] select _staticLine] call BRM_FMK_fnc_halo;
			};
		};
		case 2: {
			{ deleteVehicle _x; } foreach crew _vehicle;
			deleteGroup group _vehicle;
			deleteVehicle _vehicle;
		};
	};
};

{
	_x params ["_unit", "_role", "_cargoIndex", "_turretPath"];
	if !(isPlayer _unit) then {
		switch (_role) do {
			case "driver": {
				_vehicle lockDriver true;
			};
			case "commander";
			case "gunner";
			case "turret": {
				_vehicle lockTurret [_turretPath, true];
			};
			case "cargo": {
				_vehicle lockCargo [_cargoIndex, true];
			};
		};

		_unit disableAI "FSM";
		_unit disableAI "AUTOCOMBAT";
		_unit disableAI "AUTOTARGET";
		_unit disableAI "TARGET";
		_unit setCaptive true;
	};
} forEach fullCrew _vehicle;

private _synchronizedObjects = synchronizedObjects _vehicle;
if (_synchronizedObjects isEqualTo []) then {
	_synchronizedObjects = call BIS_fnc_listPlayers;
};
{
	_x moveInCargo _vehicle;
} forEach _synchronizedObjects;

private _altitude = getPosASL _vehicle select 2;
_vehicle flyInHeightASL [_altitude, _altitude, _altitude];

private _waypoints = waypoints _vehicle;
if (count _waypoints != 2) exitWith { ["No waypoint for drop location."] call BIS_fnc_error; };
private _dropWaypoint = _waypoints select 1;

waypointStatements _dropWaypoint params ["_condition", "_statement"];
_statement = _statement + format ["; [objectParent this, %1, %2, 0] call BRM_FMK_fnc_paratroop", _staticLine, str _backpack];
_dropWaypoint setWaypointStatements [_condition, _statement];

private _posASL = getPosASL _vehicle;
private _deleteWaypoint = group _vehicle addWaypoint [_posASL vectorAdd (AGLToASL waypointPosition _dropWaypoint vectorDiff _posASL vectorMultiply 2), -1];
_deleteWaypoint setWaypointStatements ["true", format ["[objectParent this, %1, %2, 2] call BRM_FMK_fnc_paratroop", _staticLine, str _backpack]];
