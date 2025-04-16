#include "../../defines.hpp"

if !(isServer) exitWith {};

TRACE_1("fn_startZeus: %1", _this);

params [["_player", objNull]];

if (isNull _player || { _player isKindOf "HeadlessClient_F" }) exitWith {
	["BRM_FMK_RHEA_zeusStarted", [1], _player] call CBA_fnc_targetEvent;
};

if (!(_player getVariable ["BRM_FMK_RHEA_loggedIn", false])) exitWith {
	["BRM_FMK_RHEA_zeusStarted", [2], _player] call CBA_fnc_targetEvent;
};

if (!isNull getAssignedCuratorLogic _player) exitWith {
	["BRM_FMK_RHEA_zeusStarted", [3], _player] call CBA_fnc_targetEvent;
};

private _index = BRM_FMK_RHEA_server_zeusSlots findIf { isNull getAssignedCuratorUnit _x };
if (_index != -1) then {
	["BRM_FMK_RHEA_zeusStarted", [0], _player] call CBA_fnc_targetEvent;
	_player assignCurator (BRM_FMK_RHEA_server_zeusSlots select _index);
	missionNamespace setVariable [format ["BRM_FMK_RHEA_server_zeus%1", _index], _player];
	_player setVariable ["BRM_FMK_RHEA_server_zeus", _index];
} else {
	["BRM_FMK_RHEA_zeusStarted", [4], _player] call CBA_fnc_targetEvent;
};
