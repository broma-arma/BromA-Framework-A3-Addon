params ["_id","_camps","_zone"];

private _side = ([_id] call BRM_FMK_AIS_getSpawner) select AIS_SPAWNER_SIDE;

{
	_x params ["_entity"];

	private _marker = [_id,_entity,"loc_move",([_side,true] call BRM_FMK_AIS_getSideColor),""] call BRM_FMK_AIS_createIconMarker;
	private _line = [_id,_entity,_zone,([_side,true] call BRM_FMK_AIS_getSideColor),2] call BRM_FMK_AIS_drawMarkerLine;
} forEach _camps;
