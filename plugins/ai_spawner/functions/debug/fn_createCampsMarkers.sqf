params ["_id", "_camps", "_zone"];

private _spawner = [_id] call BRM_FMK_AIS_fnc_getSpawner;
private _side = _spawner select BRM_FMK_AIS_SPAWNER_SIDE;
private _color = [_side, true] call BRM_FMK_AIS_fnc_getSideColor;

{
	_x params ["_entity", "_type", "_spawns"];

	[_id, _entity, "loc_move", _color, format ["%1 (%2)", _type, _spawns]] call BRM_FMK_AIS_fnc_createIconMarker;
	[_id, _entity, _zone, _color, 2] call BRM_FMK_AIS_fnc_drawMarkerLine;
} forEach _camps;
