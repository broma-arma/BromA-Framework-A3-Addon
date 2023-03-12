params ["_id"];

private _spawner = [_id] call BRM_FMK_AIS_fnc_getSpawner;

AIS_spawners = AIS_spawners - [_spawner];

if (AIS_debug) then {
	systemChat format ["Spawner %1 has been deleted!",(_spawner select 0)];
	private _markers = allMapMarkers select {_x find _id != -1};
	{
		deleteMarker _x;
	} forEach _markers;
};

{
	deleteVehicle (_x select 0);
} forEach (_spawner select AIS_SPAWNER_CAMPS);


if (_spawner select AIS_SPAWNER_CLEANUP) then {
	{
		_x params ["_type","_group"];

		private _isPlayerNear = false;
		private _leader = objNull;
		private _entities = [];

		waitUntil {

			_isPlayerNear = false;

			_leader = leader _group;
			_entities = _leader nearEntities ["Man",AIS_cleanUpPlayerRadius];

			{
				if (isPlayer _x) exitWith { _isPlayerNear = true; };
			} forEach _entities;

			!(_isPlayerNear)
		};

		{
			deleteVehicle _x;
		} forEach (units _group);

	} forEach (_spawner select AIS_SPAWNER_GROUPS);
};
