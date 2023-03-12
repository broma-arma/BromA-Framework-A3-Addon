params ["_id","_positions"];

#define SPAWN_MARKER_ICON "loc_move"
#define ATTACK_MARKER_ICON "mil_dot"

private _side = ([_id] call BRM_FMK_AIS_fnc_getSpawner) select AIS_SPAWNER_SIDE;

BRM_FMK_AIS_fnc_createMarker = {
	params ["_id","_entity","_icon","_side"];

	private _position = [_entity] call BRM_FMK_AIS_fnc_toPosition;
	private _marker = createMarker [_id, _position];

	_marker setMarkerShape "ICON";
	_marker setMarkerType _icon;
	_marker setMarkerColor ([_side,true] call BRM_FMK_AIS_fnc_getSideColor);

	_marker
};

_positions params ["_spawnPositions","_attackPosition"];

{
	private _markerId = format ["ais_%1_%2",_id,_x];
	private _icon = "";

	if (_forEachIndex == (count(_spawnPositions + [_attackPosition]) - 1)) then {
		_icon = ATTACK_MARKER_ICON;
	} else {
		_icon = SPAWN_MARKER_ICON;
		private _line = [_id,_x,_attackPosition,([_side,true] call BRM_FMK_AIS_fnc_getSideColor),2] call BRM_FMK_AIS_fnc_drawMarkerLine;
	};

	if (!(_markerId in allMapMarkers)) then {
		[_markerId,_x,_icon,_side] call BRM_FMK_AIS_fnc_createMarker;
	};
} forEach _spawnPositions + [_attackPosition];
