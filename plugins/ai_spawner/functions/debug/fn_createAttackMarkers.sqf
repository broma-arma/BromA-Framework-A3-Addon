#include "script_component.hpp"
#define SPAWN_MARKER_ICON "loc_move"
#define ATTACK_MARKER_ICON "mil_dot"

diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_id", "_positions"];
_positions params ["_spawnPositions", "_attackPosition"];

private _spawner = [_id] call FUNC(getSpawner);
private _side = _spawner getVariable "side";
private _color = [_side, true] call FUNC(getSideColor);

{
	private _icon = "";
	if (_forEachIndex == count _spawnPositions) then {
		_icon = ATTACK_MARKER_ICON;
	} else {
		_icon = SPAWN_MARKER_ICON;
		[_id, _x, _attackPosition, _color, 2] call FUNC(drawMarkerLine);
	};

	private _markerId = format [QGVAR(%1_%2), _id, _x];
	if (getMarkerType _markerId == "") then {
		[true, _markerId, [_x] call FUNC(toPosition) select [0, 2], "ICON", nil, _icon, _color] call FUNCMAIN(newMarker);
	};
} forEach _spawnPositions + [_attackPosition];
