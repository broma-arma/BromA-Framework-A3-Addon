params ["_unit"];

if (isServer) then {
	if !(isRemoteExecuted || hasInterface) exitWith {
		_this remoteExecCall ["BRM_FMK_Plugin_RespawnSystem_fnc_removeFromMission", _unit];
	};

	BRM_FMK_Plugin_RespawnSystem_deadPlayers pushBackUnique [getPlayerUID _unit, name _unit, _unit call BIS_fnc_objectSide];
};

if (hasInterface && local _unit) then {
	if (!isServer) then {
		_this remoteExecCall ["BRM_FMK_Plugin_RespawnSystem_fnc_removeFromMission", 2];
	};

	_unit setVariable ["isDead", true, true];
	_unit setVariable ["respawnGroup", group _unit call BIS_fnc_netId, true];

	[true] call BRM_FMK_fnc_setSpectating;
};
