params ["_id"];

private _spawner = [_id] call BRM_FMK_AIS_fnc_getSpawner;

BRM_FMK_AIS_spawners = BRM_FMK_AIS_spawners - [_spawner];

if (BRM_FMK_AIS_debug) then {
	systemChat format ["Spawner %1 has been deleted!", _spawner select 0];
	{
		deleteMarker _x;
	} forEach (allMapMarkers select { _x find _id != -1 }); // TODO I'm not finding a created marker for this?
};

{
	deleteVehicle (_x select 0);
} forEach (_spawner select BRM_FMK_AIS_SPAWNER_CAMPS);

if (_spawner select BRM_FMK_AIS_SPAWNER_CLEANUP) then {
	{
		_x params ["_type", "_group"];

		waitUntil { leader _group nearEntities ["CAManBase", BRM_FMK_AIS_cleanUpPlayerRadius] findIf { isPlayer _x } == -1 };

		// TODO Should this also delete the group's vehicle?
		{
			deleteVehicle _x;
		} forEach (units _group);
	} forEach (_spawner select BRM_FMK_AIS_SPAWNER_GROUPS);
};
