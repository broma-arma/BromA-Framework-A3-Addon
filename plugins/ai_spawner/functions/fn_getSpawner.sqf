params ["_id"];

private _spawner = (AIS_spawners select {(_x select 0) == _id}) select 0;

_spawner
