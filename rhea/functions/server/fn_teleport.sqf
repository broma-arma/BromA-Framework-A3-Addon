#include "../../defines.hpp"

TRACE_1("fn_teleport: %1", _this);

params [["_from", objNull], ["_to", objNull]];

if (isNull _from || isNull _to) exitWith {};

if (!local _from) exitWith {
	[_from, _to] remoteExecCall ["BRM_FMK_RHEA_REMOTE_fnc_teleport", _from];
};

private _toVehicle = objectParent _to;
if (isNull _toVehicle) then {
	private _toPos = getPos _to;
	private _emptyTo = _toPos findEmptyPosition [1, 10, typeOf _from];
	_toPos = if (count _emptyTo > 0) then {
		_emptyTo select [0, 2]
	} else {
		private _theta = random 360;
		_toPos vectorAdd ([sin _theta, cos _theta, 0] vectorMultiply random 9 + 1)
	};
	_toPos = _toPos select [0, 2];

	private _fromVehicle = objectParent _from;
	if !(isNull _fromVehicle) then {
		_from action ["getOut", _fromVehicle];
	};

	if (isDamageAllowed _from) then {
		_from allowDamage false;
		_from setPos _toPos;
		[{ _this allowDamage true; }, _from, 2] call CBA_fnc_waitAndExecute;
	} else {
		_from setPos _toPos;
	};
} else {
	private _roleOrder = ["cargo", "ffvturret", "turret", "commander", "gunner", "driver"];
	private _emptySeats = fullCrew [_toVehicle, "", true] select { isNull (_x select 0) } apply {
		_x params ["_unit", "_role", "_cargoIndex", "_turretPath", "_personTurret"];
		if (_role == "turret" && _personTurret) then {
			_role = "ffvturret";
		};
		[_roleOrder find toLower _role, _cargoIndex, _turretPath]
	};
	_emptySeats sort true;

	if (count _emptySeats > 0) then {
		_emptySeats select 0 params ["_seat", "_cargoIndex", "_turretPath"];

		private _fnc_moveInVehicle = {
			params ["_from", "_toVehicle", "_seat", "_cargoIndex", "_turretPath"];

			switch (_seat) do {
				case 0: { _from moveInCargo [_toVehicle, _cargoIndex]; }; // cargo
				case 1; // ffvTurret
				case 2: { _from moveInTurret [_toVehicle, _turretPath]; }; // turret
				case 3: { _from moveInCommander _toVehicle; }; // commander
				case 4: { _from moveInGunner _toVehicle; }; // gunner
				case 5: { _from moveInDriver _toVehicle; }; // driver
			};
		};

		private _fromVehicle = objectParent _from;
		if (isNull _fromVehicle) then {
			[_from, _toVehicle, _seat, _cargoIndex, _turretPath] call _fnc_moveInVehicle;
		} else {
			_from action ["getOut", _fromVehicle];
			[{ isNull objectParent (_this select 0) }, _fnc_moveInVehicle, [_from, _toVehicle, _seat, _cargoIndex, _turretPath]] call CBA_fnc_waitUntilAndExecute;
		};
	};
};
