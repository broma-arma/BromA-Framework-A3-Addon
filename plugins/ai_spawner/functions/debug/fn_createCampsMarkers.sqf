#include "script_component.hpp"
diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_id", "_camps", "_zone"];

private _spawner = [_id] call FUNC(getSpawner);
private _side = _spawner getVariable "side";
private _color = [_side, true] call FUNC(getSideColor);

{
	_x params ["_entity", "_type", "_spawns"];

	[_id, _entity, "loc_move", _color, format ["%1 (%2)", _type, _spawns]] call FUNC(createIconMarker);
	[_id, _entity, _zone, _color, 2] call FUNC(drawMarkerLine);
} forEach _camps;
