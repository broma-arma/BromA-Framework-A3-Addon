params ["_uid", ["_status", []]];

if (count _status == 0) exitWith {
	if (isServer) then {
		if (isRemoteExecuted) then {
			// Send status information to the client.
			private _status = BrmFmk_SyncStatus_status deleteAt _uid;
			if (!isNil "_status") then {
				[_uid, _status] remoteExec ["BRM_FMK_SyncStatus_fnc_loadStatus", remoteExecutedOwner];
			};
		} else {
			diag_log text "[BrmFmk.SyncStatus.loadStatus] Error: Function must be remoteExec'd.";
		};
	} else {
		// Request status data from the server.
		[_uid] remoteExec ["BRM_FMK_SyncStatus_fnc_loadStatus", 2];
	};
};

if !(hasInterface) exitWith {
	diag_log text "[BrmFmk.SyncStatus.loadStatus] Error: Attempted to load status for non-client.";
};

_status params ["_playerVar", "_playerDir", "_playerPos", "_playerDamage", "_vehicle", "_vehicleSeat", "_playerGear", "_playerVars"];

private _damageAllowed = isDamageAllowed player;
player allowDamage false;

if (_playerVar == [player] call BIS_fnc_objectVar) then {
	player setUnitLoadout _playerGear;
};

player setDir _playerDir;
player setDamage _playerDamage;

private _defaultHandler = { player setVariable [_name, _value, true] };
{
	private _varValues = _playerVars select _forEachIndex;
	{
		_x params ["_name", "_defaultValue", ["_handler", _defaultHandler]];
		private _value = _varValues select _forEachIndex;
		call _handler;
	} forEach _x;
} forEach call BRM_FMK_SyncStatus_fnc_playerVars;

if (!isNull _vehicle && {alive _vehicle}) then {
	private _seats = [toLower _vehicleSeat];
	{ _seats pushBackUnique _x } forEach ["cargo", "gunner", "driver", "commander", "any"];

	while {vehicle player != _vehicle && alive _vehicle} do {
		{
			switch (_x) do {
				case "cargo": { player moveInCargo _vehicle; };
				case "gunner": { player moveInGunner _vehicle; };
				case "driver": { player moveInDriver _vehicle; };
				case "commander": { player moveInCommander _vehicle; };
				case "any": { player moveInAny _vehicle; };
			};
			if !(isNull objectParent player) exitWith {};
		} forEach _seats;

		sleep 1;
	};
	if (isNull objectParent player) then {
		player setPosATL _playerPos;
	};
} else {
	player setPosATL _playerPos;
};

if (_damageAllowed) then {
	0 spawn {
		sleep 1;
		player allowDamage true;
	};
};
