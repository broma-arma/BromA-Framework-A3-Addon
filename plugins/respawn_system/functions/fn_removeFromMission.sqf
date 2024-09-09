params ["_unit"];

if (isServer) then {
	if !(isRemoteExecuted || hasInterface) exitWith {
		_this remoteExecCall ["BRM_FMK_RespawnSystem_fnc_removeFromMission", _unit];
	};

	mission_dead_players pushBackUnique [getPlayerUID _unit, name _unit, _unit call BIS_fnc_objectSide];
	publicVariable "mission_dead_players";
};

if (hasInterface && local _unit) then {
	if (!isServer) then {
		_this remoteExecCall ["BRM_FMK_RespawnSystem_fnc_removeFromMission", 2];
	};

	_unit setVariable ["isDead", true, true];
	_unit setVariable ["respawnGroup", group _unit call BIS_fnc_netId, true];

	[_unit] call BRM_FMK_fnc_initSpectator;
};
