#include "../../defines.hpp"

if (!isServer) exitWith {};

TRACE_1("fn_rearmVehicle: %1", _this);

{
	private _vehicle = _x;
	if (!isNull _vehicle) then {
		private _turretOwners = [owner _vehicle] + (allTurrets _vehicle apply { _vehicle turretOwner _x });
		[_vehicle, 1] remoteExec ["setVehicleAmmo", _turretOwners arrayIntersect _turretOwners];
	};
} forEach _this;
