diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_id", "_entity", "_type", "_color", ["_text", ""], ["_alpha", 1]];

[true, format ["BRM_FMK_AIS_ico_%1_%2", _id, _entity], _entity,
	"ICON", nil,
	_type, _color, nil,
	_text, _alpha
] call BRM_FMK_fnc_newMarker
