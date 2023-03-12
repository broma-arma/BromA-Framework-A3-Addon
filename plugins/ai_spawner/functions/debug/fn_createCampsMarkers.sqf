params ["_id","_camps","_zone"];

private _side = ([_id] call BRM_FMK_AIS_fnc_getSpawner) select BRM_FMK_AIS_SPAWNER_SIDE;

{
	_x params ["_entity"];

	private _marker = [_id,_entity,"loc_move",([_side,true] call BRM_FMK_AIS_fnc_getSideColor),""] call BRM_FMK_AIS_fnc_createIconMarker;
	private _line = [_id,_entity,_zone,([_side,true] call BRM_FMK_AIS_fnc_getSideColor),2] call BRM_FMK_AIS_fnc_drawMarkerLine;
} forEach _camps;
