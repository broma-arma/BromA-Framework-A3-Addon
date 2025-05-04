#include "../../defines.hpp"

if !(isServer) exitWith {};

TRACE_1("fn_logoutPlayer: %1", _this);

params [["_player", objNull]];

if (_player call BRM_FMK_RHEA_fnc_isLoggedIn) then {
	BRM_FMK_RHEA_Channel radioChannelRemove [_player];

	private _module = getAssignedCuratorLogic _player;
	if (!isNull _module && { _module getVariable ["BRM_FMK_RHEA_server_zeus", false] }) then {
		private _index = BRM_FMK_RHEA_server_zeusSlots findIf { _x == _module };
		if (_index != -1) then {
			_player setVariable ["BRM_FMK_RHEA_server_zeus", nil];
			missionNamespace setVariable [format ["BRM_FMK_RHEA_server_zeus%1", _index], objNull];
			unassignCurator _module;
			_module removeCuratorEditableObjects [curatorEditableObjects _module, false];
		};
	};

	_player setVariable ["BRM_FMK_RHEA_loggedIn", false, true];
};
