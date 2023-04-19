#include "script_component.hpp"
diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_id", "_zone", ["_alpha", 0.25]];

private _area = triggerArea _zone;
_area params ["_areaX", "_areaY", "_angle", "_isRectangle"];

[true, format [QGVAR(mrk_%1_%2), _id, _zone], _zone,
	["ELLIPSE", "RECTANGLE"] select _isRectangle, nil, nil,
	[[_id] call FUNC(getSpawner) get "side", true] call FUNC(getSideColor),
	[_areaX, _areaY], nil,
	_angle, _alpha
] call FUNCMAIN(newMarker)
