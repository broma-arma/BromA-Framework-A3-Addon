params ["_id"];

private _spawner = (BRM_FMK_AIS_spawners select {(_x select 0) == _id}) select 0;

_spawner
