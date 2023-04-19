#include "script_component.hpp"
params ["_unit"];

if (isServer) then {
	if !(isRemoteExecuted || hasInterface) exitWith {
		_this remoteExecCall [QFUNC(removeFromMission), _unit];
	};

	mission_dead_players pushBackUnique [getPlayerUID _unit, name _unit, _unit getVariable "unit_side"];
	publicVariable "mission_dead_players";
};

if (hasInterface && local _unit) then {
	if (!isServer) then {
		_this remoteExecCall [QFUNC(removeFromMission), 2];
	};

	_unit setVariable ["isDead", true, true];
	_unit setVariable ["respawnGroup", group _unit call BIS_fnc_netId, true];

	[_unit] call FUNCMAIN(initSpectator);
};
