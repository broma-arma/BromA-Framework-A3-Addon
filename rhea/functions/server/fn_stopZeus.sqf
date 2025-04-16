#include "../../defines.hpp"

if (!isServer) exitWith {};

TRACE_1("fn_stopZeus: %1", _this);

params [["_player", objNull]];

if (!isRemoteExecuted && isMultiplayer || { isNull _player } || { _player isKindOf "HeadlessClient_F" }) exitWith {
	["BRM_FMK_RHEA_zeusStopped", [1], _player] call CBA_fnc_targetEvent;
};

private _module = getAssignedCuratorLogic _player;
if (isNull _module) exitWith {
	["BRM_FMK_RHEA_zeusStopped", [2], _player] call CBA_fnc_targetEvent;
};

if !(_module getVariable ["BRM_FMK_RHEA_server_zeus", false]) exitWith {
	["BRM_FMK_RHEA_zeusStopped", [3], _player] call CBA_fnc_targetEvent;
};

private _index = BRM_FMK_RHEA_server_zeusSlots findIf { _x == _module };
if (_index != -1) then {
	["BRM_FMK_RHEA_zeusStopped", [0], _player] call CBA_fnc_targetEvent;
	_player setVariable ["BRM_FMK_RHEA_server_zeus", nil];
	missionNamespace setVariable [format ["BRM_FMK_RHEA_server_zeus%1", _index], objNull];
	unassignCurator _module;
	_module removeCuratorEditableObjects [curatorEditableObjects _module, false];
};
