params ["_control"];

private _iconSize = 32;
private _iconScreenSqr = (_iconSize * 0.0007) ^ 2;

private _mousePosition = getMousePosition;
{
	_x params ["_groupId", "_pos", "_icon", "_color"];

	private _mouseOver = (_control ctrlMapWorldToScreen _pos distanceSqr _mousePosition) < _iconScreenSqr;
	private _size = if (_mouseOver) then { _iconSize * 1.2 } else { _iconSize };

	_control drawIcon [_icon, _color, _pos, _size, _size, 0, if (_mouseOver) then { _groupId } else { "" }];
} forEach BRM_FMK_Plugin_GroupMarkers_markers;
