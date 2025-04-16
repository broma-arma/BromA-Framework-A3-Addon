#include "../../defines.hpp"

if (!isServer) exitWith {};

TRACE_1("fn_deleteDead: %1", _this);

params ["_distance"];

private _distanceSqr = _distance * _distance;
{
	private _object = _x;
	if (_distanceSqr == 0 || { allPlayers findIf { _object distanceSqr _x < _distanceSqr } == -1 }) then {
		deleteVehicle _object;
	};
} forEach allDead;
