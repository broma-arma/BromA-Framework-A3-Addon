/*
================================================================================

NAME:
    BRM_FMK_fnc_driverless

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Add driverless option to a vehicle.

PARAMETERS:
    0 - Vehicle. (OBJECT)

USAGE:
    this call BRM_FMK_fnc_driverless;

RETURNS:
    Nothing.

================================================================================
*/

params [["_vehicle", objNull, [objNull]]];

if (isNull _vehicle || { !(_vehicle isKindOf "LandVehicle") }) exitWith {};

if (isServer) exitWith {
	if (isNil "BRM_FMK_fnc_driverless_Update") then {
		BRM_FMK_fnc_driverless_Update = compileFinal {
			params ["_vehicle"];

			private _agent = _vehicle getVariable ["BRM_FMK_fnc_driverless_Driver", objNull];
			if (!isNull _agent) then {
				if (_agent != driver _vehicle) then {
					deleteVehicle _agent;
				} else {
					private _effectiveCommander = effectiveCommander _vehicle;
					if (_effectiveCommander != _vehicle getVariable "BRM_FMK_fnc_driverless_EffectiveCommander") then {
						private _ownerCommand = owner _effectiveCommander;
						if (owner _agent != _ownerCommand) then {
							_agent setOwner _ownerCommand;
						};
						_vehicle setVariable ["BRM_FMK_fnc_driverless_EffectiveCommander", _effectiveCommander];
					};
				};
			};
		};
	};

	_vehicle setVariable ["BRM_FMK_fnc_driverless_EffectiveCommander", effectiveCommander _vehicle];

	private _fnc_update = { _this select 0 call BRM_FMK_fnc_driverless_Update; };
	_vehicle addEventHandler ["GetIn", _fnc_update];
	_vehicle addEventHandler ["GetOut", _fnc_update];
	_vehicle addEventHandler ["SeatSwitched", _fnc_update];
};

if (!hasInterface) exitWith {};

if (isNil "BRM_FMK_fnc_driverless_Action") then {
	BRM_FMK_fnc_driverless_Action = ["BRM_FMK_fnc_driverless_driverAction", "Add Driver", "", {
			private _agent = _target getVariable ["BRM_FMK_fnc_driverless_Driver", objNull];
			if (isNull _agent) then {
				_agent = createAgent [["B_crew_F", "O_crew_F", "I_crew_F", "C_man_1"] select ([blufor, opfor, independent, civilian] find playerSide), [0, 0, 0], [], 0, "CAN_COLLIDE"];
				_target setVariable ["BRM_FMK_fnc_driverless_Driver", _agent, true];
				_agent moveInDriver _target;
				[_agent, [playerSide, "faction"] call BRM_FMK_fnc_getSideInfo] call BRM_fnc_initAI;
			} else {
				deleteVehicle _agent;
			};
		}, {
			effectiveCommander _target == _player
				&& (!isNull (_target getVariable ["BRM_FMK_fnc_driverless_Driver", objNull])
					|| isNull driver _target)
		}, nil, nil, nil, nil, nil, {
			_this select 3 set [1, ["Remove Driver", "Add Driver"] select (isNull (_target getVariable ["BRM_FMK_fnc_driverless_Driver", objNull]))];
		}
	] call ace_interact_menu_fnc_createAction;

	BRM_FMK_fnc_driverlessNote = compileFinal {
		params ["_vehicle", "_role"];

		if (_role != "cargo" && _vehicle getVariable ["BRM_FMK_fnc_driverlessNote", false]) then {
			_vehicle setVariable ["BRM_FMK_fnc_driverlessNote", nil];
			private _message = "This vehicle is driverless-capable. ";
			if (_role == "driver") then {
				_message = _message + "Switch to a different seat and ";
			};
			systemChat (_message + "ACE interact with the vehicle. (Effective vehicle commander only)");
		};
	};

	player addEventHandler ["GetInMan", {
		params ["_unit", "_role", "_vehicle", "_turret"];
		[_vehicle, _role] call BRM_FMK_fnc_driverlessNote;
	}];
	player addEventHandler ["SeatSwitchedMan", {
		params ["_unit", "_unit2", "_vehicle"];
		[_vehicle, assignedVehicleRole _unit param [0, ""]] call BRM_FMK_fnc_driverlessNote;
	}];
};

_vehicle setVariable ["BRM_FMK_fnc_driverlessNote", true];
[_vehicle, 1, ["ACE_SelfActions"], BRM_FMK_fnc_driverless_Action] call ace_interact_menu_fnc_addActionToObject;

nil
