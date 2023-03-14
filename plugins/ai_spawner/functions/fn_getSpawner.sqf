params ["_id"];

// TODO Change BRM_FMK_AIS_spawners to be in BIS_fnc_getFromPairs format
private _index = BRM_FMK_AIS_spawners findIf { _x select 0 == _id };
if (_index == -1) exitWith { nil };

BRM_FMK_AIS_spawners select _index
