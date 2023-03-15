#define SPAWN_MARKER_ICON "loc_move"
#define ATTACK_MARKER_ICON "mil_dot"

params ["_id", "_positions"];
_positions params ["_spawnPositions", "_attackPosition"];

private _side = [_id] call BRM_FMK_AIS_fnc_getSpawner select BRM_FMK_AIS_SPAWNER_SIDE;

{
	private _icon = "";
	if (_forEachIndex == count _spawnPositions) then {
		_icon = ATTACK_MARKER_ICON;
	} else {
		_icon = SPAWN_MARKER_ICON;
		[_id, _x, _attackPosition, [_side, true] call BRM_FMK_AIS_fnc_getSideColor, 2] call BRM_FMK_AIS_fnc_drawMarkerLine;
	};

	private _markerId = format ["BRM_FMK_AIS_%1_%2", _id, _x];
	if (getMarkerType _markerId == "") then {
		[true, _markerId, _position, "ICON", nil, _icon, [_side, true] call BRM_FMK_AIS_fnc_getSideColor] call BRM_FMK_fnc_newMarker;
	};
} forEach _spawnPositions + [_attackPosition];
